library flutter_maya_sdk;

// Maya REST Client
import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:liquid_engine/liquid_engine.dart';
import 'package:hash/hash.dart';
import 'package:dbcrypt/dbcrypt.dart';

part 'vars.dart';
part 'utils.dart';
part 'background.dart';
part 'event.dart';
part 'resource.dart';

class Maya {
  static Maya? instance;
  Map<String, dynamic> _user = {};
  Map<Key, http.Client> _fetch = {};
  Map<String, String> _cache = {};
  Map<String, Timer> _cacheTTL = {};
  Map<String, dynamic> _config = {};
  static bool get isConfigured => instance?._config.keys.isNotEmpty ?? false;
  static bool get isNotConfigured => !isConfigured;
  static Duration timeStamp = Duration(microseconds: 10);
  Maya({
    // Maya host (url)
    required Uri server,
    required String token,
    Map<String, dynamic>? defaultFilter,
    Map<String, dynamic> api = const {},
  }) {
    var baseUrl = server.path;
    server = server.replace(path: "", query: "");
    Map<String, dynamic> config = {
      "api": api,
      "server": server.toString().replaceFirst(RegExp(r"\?$"), ""),
      "token": token,
      "baseUrl": baseUrl,
      "filter": defaultFilter
    };

    if (config["api"] == null) config["api"] = <String, dynamic>{};
    if (config["baseUrl"] == null) config["baseUrl"] = "";
    _config = config;
    if ((_config["baseUrl"] as String).endsWith("/"))
      _config["baseUrl"] =
          _config["baseUrl"].substring(0, _config["baseUrl"].length - 1);
    _config["baseUrl"] =
        ("/" + _config["baseUrl"]).replaceAll(RegExp(r"/+"), "/");
    if (_config["server"].endsWith("/"))
      _config["server"] =
          _config["server"].substring(0, _config["server"].length - 1);
    if (!isConfigured) instance = this;
  }
  // static API collection(String collection) => ;
  static init(
      {
      // Maya host (url)
      required Uri server,
      required String token,
      Map<String, dynamic>? defaultFilter,
      Map<String, dynamic> api = const {}}) {
    if (isNotConfigured)
      Maya(
          server: server, token: token, defaultFilter: defaultFilter, api: api);
  }

  // private function
  void closeRequest(Key requestKey) {
    if (_fetch.containsKey(requestKey)) {
      try {
        if (_fetch[requestKey] != null){
          _fetch[requestKey]!.close();
        }
      } catch(e, s){
        // debugPrint("---ERROR---");
        // debugPrint(e.toString());
        // debugPrint(s.toString());
      } 
      _fetch.remove(requestKey);
    }
  }

  Future<_MayaResourceRawRes> Function({
    int? limit,
    int? page,
    String? id,
    dynamic fields,
    bool? populate,
    Map<String, dynamic>? filter,
    bool? ignoreDefaultFilter,
    Map<String, dynamic>? save,
    String? operation,
    Key? requestKey,
    Duration? cache,
  }) resourceRaw(String prop,
      {bool? isSingleton, bool? isForm, bool? isApi, Key? key}) {
    return ({
      page,
      id,
      fields,
      filter,
      save,
      operation,
      requestKey,
      cache,
      ignoreDefaultFilter = false,
      limit = 10,
      populate = true,
    }) async {
      // limit = limit ?? 10;
      // populate = populate ?? true;
      // save = save ?? null;
      // cache = cache ?? Duration(hours: 1);
      // ignoreDefaultFilter = ignoreDefaultFilter ?? false;
      if (!Maya.isConfigured) throw "config is not defined";
      Map<String, dynamic> params = {};
      final Map<String, dynamic> api = {};
      final Map<String, dynamic> obj = _config["api"];
      String _prop = obj.containsKey(prop)
          ? prop
          : prop.replaceFirst(RegExp(r"^[\*@#!]"), "");
      if (obj.containsKey(prop) || obj.containsKey(_prop)) {
        // populate api
        (obj[_prop] as Map<String, dynamic>).forEach((key, value) {
          api[key] = value;
        });
      } else {
        if (!RegExp(r"^(@|#|\*|!)").hasMatch(prop)) {
          api["collection"] = prop;
        }
      }
      if ((isApi ?? false) && !RegExp(r"^(@|#|\*|!)").hasMatch(prop)) {
        prop = "!$prop";
      } else if ((isForm ?? false) && !RegExp(r"^(@|#|\*|!)").hasMatch(prop)) {
        prop = "#$prop";
      } else if ((isSingleton ?? false) &&
          !RegExp(r"^(@|#|\*|!)").hasMatch(prop)) {
        prop = "@$prop";
      } else if (!RegExp(r"^(@|#|\*|!)").hasMatch(prop)) {
        prop = "*$prop";
      }

      if (RegExp(r"^(@|#|\*|!)").hasMatch(prop)) {
        switch (prop[0]) {
          case "*": // collection
            api["isForm"] = false;
            api["isSingleton"] = false;
            api["isApi"] = false;
            break;
          case "#": // Form
            api["isForm"] = true;
            api["isSingleton"] = false;
            api["isApi"] = false;
            break;
          case "@": // Singleton
            api["isForm"] = false;
            api["isSingleton"] = true;
            api["isApi"] = false;
            break;
          case "!": // Api
            api["isForm"] = false;
            api["isSingleton"] = false;
            api["isApi"] = true;
            break;
          default:
        }
      }
      if (api["isForm"] != null && api["isForm"] && save == null)
        throw "$_prop is a form";
      if (api["isSingleton"] != null && api["isSingleton"] && save != null)
        throw "$_prop is a singleton";
      if (save == null) {
        fields =
            fields ?? (id != null ? api["findOneFields"] : api["fields"]) ?? [];
        Map<String, bool> _finalFields = {};
        if (fields is String) {
          fields = fields.split(RegExp(r"(,|;)"));
        }
        if (fields is List) {
          fields.forEach((b) {
            _finalFields[b.toString()] = true;
          });
        } else if (fields is Map) {
          fields.forEach((b, v) {
            _finalFields[b.toString()] = true;
          });
        }
        Map<String, dynamic> tmp = {};
        if (id != null && save == null) {
          tmp.addAll({"_id": id});
        } else if (save == null) {
          tmp.addAll(filter ?? {});
        }
        if ((ignoreDefaultFilter ?? false) == false) {
          tmp = {
            r"$and": [
              if (_config["filter"] != null) _config["filter"] ?? {},
              if (api["filter"] != null) api["filter"] ?? {},
              tmp
            ]
          };
          if (tmp[r"$and"].length == 1) tmp = tmp[r"$and"][0];
        }
        bool _populate = (populate ?? api["populate"] ?? true);
        // print("Filtre $tmp");
        params = {
          "limit": id != null ? null : (limit ?? api["limit"] ?? 10),
          "skip": id != null
              ? null
              : (page != null ? ((page + 1) * (limit ?? api["limit"])) : 0),
          "sort": id != null ? null : (api["sort"] ?? {"_created": -1}),
          "simple": 1,
          "populate": _populate ? 1 : 0,
          "fields": _finalFields,
          "filter": tmp
        };
      }
      String collectionName;
      isSingleton = isSingleton ??
          api["isSingleton"] != null &&
              api["isSingleton"] is bool &&
              api["isSingleton"] == true;
      isForm = isForm ??
          api["isForm"] != null &&
              api["isForm"] is bool &&
              api["isForm"] == true;
      isApi = isApi ??
          api["isApi"] != null && api["isApi"] is bool && api["isApi"] == true;

      if (isForm!)
        collectionName = api["form"] ?? api["url"] ?? _prop;
      else if (isSingleton!)
        collectionName = api["singleton"] ?? api["url"] ?? _prop;
      else if (isApi!)
        collectionName = api["api"] ?? api["url"] ?? _prop;
      else
        collectionName = api["collection"] ?? api["url"] ?? _prop;

      String url = (api["server"] ?? _config["server"]) +
          (api["baseUrl"] ?? _config["baseUrl"] ?? "") +
          "/api/";
      if (!(isApi!)) {
        if (save != null)
          url += (isForm! ? 'forms/submit/' : 'collections/save/');
        else
          url += (isSingleton! ? 'singletons' : 'collections') + '/get/';
      }
      url += collectionName;
      if ((isApi!) && operation != null && operation.isNotEmpty) {
        operation = operation.replaceAll(RegExp(r"^/"), "");
        if (url.endsWith("/")) {
          url += operation;
        } else {
          url += "/" + operation;
        }
      }
      url = "$url".replaceAll(RegExp(r"/+"), "/").replaceFirst(":/", "://");
      // print("URL $url $api");

      Key _key = requestKey ?? key ?? Key(prop);
      closeRequest(_key);
      _fetch[_key] = http.Client();

      var body = isSingleton!
          ? null
          : (save != null)
              ? jsonEncode(
                  isApi! ? save : {"${isForm! ? 'form' : 'data'}": save})
              : jsonEncode(params);
      // print("BODY $body");
      response() => _fetch[_key]!.post(
            Uri.parse(url),
            headers: {
              "Maya-Token":
                  (_user.containsKey("api_key") ? _user["api_key"] : null) ??
                      api["token"] ??
                      _config["token"] ??
                      "",
              ...(isSingleton! ? {} : {'Content-Type': 'application/json'})
            },
            body: body,
          );
      var resBody = "";
      var res;
      try {
        if (cache != null) {
          // check cache
          String cacheUrl = String.fromCharCodes(
              MD5().update("$url :: ${body ?? ''}".codeUnits).digest());
          // print("cacheUrl $cacheUrl");
          if (!_cache.containsKey(cacheUrl)) {
            resBody = (await response()).body;
            _cache[cacheUrl] = resBody;
            _cacheTTL[cacheUrl] = Timer(cache, () {
              // clear Cache
              _cache.remove(cacheUrl);
              _cacheTTL.remove(cacheUrl);
            });
          } else
            resBody = _cache[cacheUrl]!;
        } else {
          resBody = (await response()).body;
        }
        // print("resBody $resBody");
        return _MayaResourceRawRes(resBody, api);
      } finally {
        closeRequest(_key);
      }
    };
  }

  Future<List<T>> Function({
    int? limit,
    int? page,
    String? id,
    dynamic fields,
    bool? populate,
    Map<String, dynamic>? filter,
    bool? ignoreDefaultFilter,
    Map<String, dynamic>? save,
    String? operation,
    Key? requestKey,
    Duration? cache,
  }) resource<T>(String prop,
      {bool? isSingleton, bool? isForm, bool? isApi, Key? key}) {
    return ({
      page,
      id,
      fields,
      filter,
      save,
      operation,
      requestKey,
      cache,
      ignoreDefaultFilter = false,
      limit = 10,
      populate = true,
    }) async {
      var cb = resourceRaw(prop,
          isApi: isApi,
          isForm: isForm,
          isSingleton: isSingleton,
          key: requestKey ?? key);
      _MayaResourceRawRes ret = await cb(
        page: page,
        id: id,
        fields: fields,
        filter: filter,
        save: save,
        operation: operation,
        cache: cache,
        ignoreDefaultFilter: ignoreDefaultFilter,
        limit: limit,
        populate: populate,
      );
      var res = await compute(_decodeString, ret.result);
      Future<T> map(Map<String, dynamic>? el) async {
        if (el != null) {
          Map<String, dynamic> map = ret.api["map"] ?? {};
          for (var i = 0; i < map.length; i++) {
            String key = map.keys.elementAt(i);
            el[key] = await _templateEngine(map[key], {
              ...el,
              "SERVER": (ret.api["server"] ?? _config["server"]),
              "BASEURL": (ret.api["baseUrl"] ?? _config["baseUrl"] ?? "")
            });
          }
        }
        return el as T;
      }

      if (res is Map && res.length == 1 && res.containsKey("error"))
        throw res["error"];
      if (res is Map &&
          res.length == 2 &&
          res.containsKey("error") &&
          res["error"] != null &&
          res["error"] == true &&
          res.containsKey("message")) throw res["message"];
      res = (((isSingleton != null && isSingleton) || save != null)
          ? [res]
          : res); //<Map<String, dynamic>>;
      if (res is List)
        res = await Future.wait(res
            .map((value) async => map(value))
            .toList()
            .whereType<Future<T>>()
            .toList());
      return res is List ? (res.whereType<T>().toList()) : [];
    };
  }

  // utils functions

  static String hash(String plainPassword) {
    return DBCrypt()
        .hashpw(plainPassword, new DBCrypt().gensaltWithRounds(10))
        .replaceFirst(RegExp(r"^\$.{2}\$"), r"$2y$");
  }

  // Maya admin urls
  Future<Map<String, dynamic>?> login(String user, String password) async {
    Map<String, dynamic> ret = {};
    if (_user.isNotEmpty) {
      ret = _user;
    } else {
      try {
        var r = (await resource<Map<String, dynamic>>("!/maya/authUser")(
            save: {"user": user, "password": password}));
        ret = r.isNotEmpty && r.length == 1 ? r.first : {};
        _user = ret;
      } catch (e) {}
    }
    return ret.isNotEmpty ? ret : null;
  }

  Future<bool> logout() async {
    if (_user.isEmpty) {
      return false;
    }
    _user = {};
    return true;
  }

  Future<Map<String, dynamic>?> saveSystemUser(
      Map<String, dynamic>? user) async {
    if (user == null) return null;
    var ret = await resource<Map<String, dynamic>>("!/maya/saveUser")(save: {
      "user": user,
    });
    return ret.isNotEmpty ? ret.first : null;
  }

  Future<List<Map<String, dynamic>>> systemUsers(
      [Map<String, dynamic>? filter]) async {
    var ret = await resource<Map<String, dynamic>>("!/maya/listUsers")(
        save: filter == null
            ? null
            : {
                "filter": filter,
              });
    return ret;
  }

  Future<Map<String, dynamic>?> assets(Map<String, dynamic>? filter) async {
    if (filter == null) return null;
    var ret = await resource<Map<String, dynamic>>("!/maya/assets")(save: {
      "filter": filter,
    });
    return ret.isNotEmpty ? ret.first : null;
  }

  Future<String> image(String src,
      {int? width,
      int? height,
      int? quality,
      bool? domain,
      bool? o,
      bool? base64,
      Map<MayaImageFilter, int> filter = const <MayaImageFilter, int>{},
      MayaImageMode mode = MayaImageMode.thumbnail}) async {
    var ret = await resourceRaw("!/maya/assets")(save: {
      src: src,
      "f": filter
          .map((key, value) => MapEntry(_MayaImageFilter[key]!, "$value")),
      "m": _MayaImageMode[mode],
      ...(width != null ? {"w": width} : {}),
      ...(height != null ? {"h": height} : {}),
      ...(quality != null ? {"q": quality} : {}),
      ...(domain != null ? {"d": domain} : {}),
      ...(base64 != null ? {"b64": base64} : {}),
      ...(o != null ? {"o": o} : {}),
    });
    return ret.result;
  }

  // Singletons
  Future<List<Map<String, dynamic>>> listSingletons() async {
    var ret =
        await resource<Map<String, dynamic>>("!/singletons/listSingletons")();
    return ret;
  }

  // Collections
  Future<List<Map<String, dynamic>>> listCollections() async {
    var ret =
        await resource<Map<String, dynamic>>("!/collections/listCollections")();
    return ret;
  }

  Future<bool> trigger(String event,
      {String? channel = "events",
      Key? key,
      dynamic data,
      bool volatile = false}) async {
    String url = _config["server"] +
        (_config["baseUrl"] ?? "") +
        "/api/sse/publish/$channel/$event".toLowerCase();
    Key _key = key ?? Key(event);
    closeRequest(_key);
    _fetch[_key] = http.Client();
    // print(url);
    var ret = await _fetch[_key]!.post(
      Uri.parse(url),
      headers: {
        "Maya-Token":
            (_user.containsKey("api_key") ? _user["api_key"] : null) ??
                _config["token"] ??
                "",
        'Content-Type': 'application/json'
      },
      body: jsonEncode({
        "data": data != null && data is Map ? jsonEncode(data) : (data is String ? data : null),
        "volatile": volatile
      }),
    );
    closeRequest(_key);
    return ret.statusCode == 204;
  }

  /// SSE Events

  ///def: Subscribes to SSE
  ///param:
  ///[url]->URl of the SSE api
  ///[header]->Map<String,String>, key value pair of the request header
  StreamController<_MayaEvent> on(String event, {String? channel = "events", Key? key}) {
    var lineRegex = RegExp(r'^([^:]*)(?::)?(?: )?(.*)?$');
    var current_MayaEvent = _MayaEvent();
    Key _key = key ?? Key("$channel::$event");
    // ignore: close_sinks
    StreamController<_MayaEvent> streamController = new StreamController(
      onCancel: (){
        Future.delayed(timeStamp,()=>closeRequest(_key));
      }
    );
    // print("--SUBSCRIBING TO SSE---");
    String url = _config["server"] +
        (_config["baseUrl"] ?? "") +
        "api/sse/channel/$channel/$event";
    // print("-- $url ---");
    
    bool canDo ()=> !streamController.isClosed && !streamController.isPaused;
    Future.delayed(timeStamp,() async {
      while (!streamController.isClosed) {
        await Future.delayed(timeStamp); // wait one frame
        if(streamController.isPaused){
          continue;
        }
        try {
          // closeRequest(_key);
          _fetch[_key] = http.Client();
          var request = new http.Request("GET", Uri.parse(url));

          ///Adding headers to the request
          request.headers["Maya-Token"] =
              (_user.containsKey("api_key") ? _user["api_key"] : null) ??
                  _config["token"] ??
                  "";

          Future<http.StreamedResponse> response = _fetch[_key]!.send(request);
          ///Listening to the response as a stream
          response.asStream().listen((data) {
            ///Applying transforms and listening to it
            data.stream
              ..transform(Utf8Decoder()).transform(LineSplitter()).listen(
                (dataLine) async {
                // debugPrint("--LINE---");
                // debugPrint("--[ $dataLine ]---");

                  if (dataLine.isEmpty) {
                    ///This means that the complete event set has been read.
                    ///We then add the event to the stream
                    try{
                      current_MayaEvent.data = 
                        await _decodeString("${current_MayaEvent.data}".trim());
                    }catch(e){}
                    if(canDo()){
                      streamController.add(current_MayaEvent);
                      current_MayaEvent = _MayaEvent();
                    }
                    return;
                  }

                  ///Get the match of each line through the regex
                  Match match = lineRegex.firstMatch(dataLine)!;
                  var field = match.group(1);
                  if (field!.isEmpty) {
                    return;
                  }
                  var value = '';
                  if (field == 'data') {
                    //If the field is data, we get the data through the substring
                    value = dataLine.substring(
                      5,
                    );
                  } else {
                    value = match.group(2) ?? '';
                  }
                  switch (field) {
                    case 'event':
                      current_MayaEvent.event = value;
                      break;
                    case 'data':
                      current_MayaEvent.data =
                          (current_MayaEvent.data ?? '') + value + '\n';
                      break;
                    case 'id':
                      current_MayaEvent.id = value;
                      break;
                    case 'retry':
                      break;
                    case 'time':
                      try {
                        current_MayaEvent.time =
                            DateTime.fromMillisecondsSinceEpoch(
                                double.parse(value).toInt() * 1000);
                      } catch (e) {
                        current_MayaEvent.time = DateTime.now();
                      }
                      break;
                    case '':
                      current_MayaEvent.comment = value;
                      break;
                  }
                },
                onError: (e, s) {
                  if(canDo()){
                    // debugPrint('---ERROR 0---');
                    // debugPrint("$e");
                    // debugPrint(s.toString());
                    streamController.addError(e, s);
                  }
                },
              );
          }, onError: (e, s) {
            if(canDo()){
              // debugPrint('---ERROR 1---');
              // debugPrint("$e");
              // debugPrint(s.toString());
              streamController.addError(e, s);
            }
          });
        } catch (e, s) {
          if(canDo()){
            // debugPrint('---ERROR 2---');
            // debugPrint("$e");
            // debugPrint(s.toString());
            streamController.addError(e, s);
          }
        }
      }
    });
    
    return streamController;
  }
}

part of flutter_maya_sdk;


_MayeCollectionRessource MayaCollection(String collection,{
  Key? key,
  Maya? instance,
}) => _MayeCollectionRessource("*"+collection.replaceFirst(RegExp(r"^[\*@#!]"), ""), instance: instance);

_MayaGetPostResource MayaSingleton(String collection,{
  Key? key,
  Maya? instance,
}) => _MayaGetPostResource("@"+collection.replaceFirst(RegExp(r"^[\*@#!]"), ""), instance: instance);

_MayaPostResource MayaForm(String collection,{
  Key? key,
  Maya? instance,
}) => _MayaPostResource("#"+collection.replaceFirst(RegExp(r"^[\*@#!]"), ""), instance: instance);

_MayaCustomResource MayaApi(String collection,{
  Key? key,
  Maya? instance,
}) => _MayaCustomResource("!"+collection.replaceFirst(RegExp(r"^[\*@#!]"), ""), instance: instance);

class _MayaPostResource {
  final String resource;
  final Key? key;
  late final Maya _instance;
  late final Future<List<Map<String, dynamic>>> Function({
    dynamic fields,
    int? limit,
    int? page,
    String? id,
    bool? populate,
    bool? ignoreDefaultFilter,
    Map<String, dynamic>? filter,
    Map<String, dynamic>? save,
    String? operation,
    Key? requestKey,
    Duration? cache,
  }) _resource;
  _MayaPostResource(this.resource,{
    this.key,
    Maya? instance,
  }) {
        if(instance == null){
          if(Maya.isNotConfigured) throw "Maya not configured";
          _instance = Maya.instance!;
        }
    _resource = _instance.resource<Map<String, dynamic>>(resource, key: key);
  }

  Future<Map<String, dynamic>?> save({
    required Map<String, dynamic> data,
    Key? requestKey
  }) async {
    var ret = (await _resource(
      save: data,
      requestKey: requestKey ?? key ?? Key(resource)
    ));
    return (ret.isEmpty ? null : ret)?.first;
  }

    void cancelRequest([Key? requestKey]) {
    _instance.closeRequest(requestKey ?? key ?? Key(resource));
  }
}
class _MayaGetPostResource  extends _MayaPostResource{
  _MayaGetPostResource(String resource, {Maya? instance, Key? key}) : super(resource, instance: instance, key: key);
  
  Future<Map<String, dynamic>?> get({
    required String id,
    dynamic fields,
    bool? populate,
    Duration? cache,
    Key? requestKey
  }) async {
    var ret = (await _resource(
      id: id,
      fields: fields,
      populate: populate ?? true,
      cache: cache,
      limit: 1,
      requestKey: requestKey ?? key ?? Key(resource)
    ));
    return (ret.isEmpty ? null : ret)
        ?.first
        .map((key, value) => MapEntry("$key", value));
  }
}
class _MayaCustomResource extends _MayaGetPostResource{
  _MayaCustomResource(String resource, {required Maya? instance}) : super(resource, instance: instance);
    Future<T?> call<T>(String operation, {
      Map<String, dynamic>? data,
      Key? requestKey
    }) async {
      var cb =  _instance.resourceRaw(
        resource, 
        isApi: true,
        key: requestKey ?? key ?? Key(resource)
      );
      _MayaResourceRawRes ret = await cb(
        save : data,
        operation : operation,
      );
      var res = await compute(_decodeString, ret.result);
      return res as T;
    }
}

class _MayeCollectionRessource extends _MayaGetPostResource {
  _MayeCollectionRessource(String collection, {Maya? instance, Key? key}) : super(collection, instance: instance, key: key);
    Future<List<Map<String, dynamic>>> find({
    dynamic fields,
    int? limit,
    int? page,
    bool? ignoreDefaultFilter,
    bool? populate,
    Map<String, dynamic>? filter,
    Duration? cache,
    Key? key
  }) =>
      _resource(
        limit: limit,
        page: page,
        fields: fields,
        ignoreDefaultFilter: ignoreDefaultFilter ?? false,
        populate: populate ?? true,
        filter: filter,
        cache: cache,
        requestKey : key ?? Key(resource)
      );
  Future<Map<String, dynamic>?> findOne({
    dynamic fields,
    bool? ignoreDefaultFilter,
    bool? populate,
    Map<String, dynamic>? filter,
    Duration? cache,
    Key? key,
  }) async {
    var ret = (await find(
      limit: 1,
      fields: fields,
      ignoreDefaultFilter: ignoreDefaultFilter ?? false,
      populate: populate ?? true,
      filter: filter,
      cache: cache,
      key : key ?? Key(resource)
    ));
    return (ret.isEmpty ? null : ret)
        ?.first;
  }

  Future<Map<String, dynamic>?> schema({
    Key? key,
  }) async {
    var ret = await _instance.resource<Map<String, dynamic>>(
        "!/collections/collection/${this.resource}", key: key ?? Key(resource))();
    return ret.isNotEmpty ? ret.first : null;
  }

  Future<Map<String, dynamic>?> updateSchema(
      List<Map<String, dynamic>> fields, {
        Key? key
      }) async {
    var ret = await _instance.resource<Map<String, dynamic>>(
        "!/collections/updateCollection/${this.resource}", key: key ?? Key(resource))(save: {
      "data": {"fields": fields}
    });
    return ret.isNotEmpty ? ret.first : null;
  }
}

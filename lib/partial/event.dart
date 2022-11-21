part of flutter_maya_sdk;

FutureOr<bool> MayaPublishEvent(String event,{
    dynamic data,
    Maya? instance,
    bool volatile =  false
  }){
    if(instance == null){
      if(Maya.isNotConfigured) throw "Maya not configured";
      instance = Maya.instance!;
    }
    List<String> _e = event.split(RegExp(r'/'));
    String channel = _e.first;
    if(_e.length == 2){
      event = _e.last;
    } else if(_e.length == 1){
      event = _e.first;
      channel = MayaEvent.DEFAULT_CHANNEL;
    } else {
      throw "Event must be : channel/event or event";
    }
    if(channel != MayaEvent.DEFAULT_CHANNEL){
      return instance.trigger(event, channel: channel, data: data, volatile: volatile);
    }
    return false;
  }

class MayaEvent {
  static final DEFAULT_CHANNEL = "events";
  late final Maya _instance;
  late final Key _key;
  late final String channel;
  late final String event;
  late StreamController<_MayaEvent> _stream;
  Stream<_MayaEvent> get stream => _stream.stream;
  MayaEvent(String eventName,{
    Maya? instance,
    String? channelName,
    Key? key
  }) {
    if(instance == null){
      if(Maya.isNotConfigured) throw "Maya not configured";
      _instance = Maya.instance!;
    }
    List<String> _e = eventName.split(RegExp(r'/'));
    if(_e.length == 2){
      event = _e.last;
      channelName = _e.first;
    } else if(_e.length == 1){
      event = _e.first;
    }
    channel = channelName ?? DEFAULT_CHANNEL;
    _key = key ?? Key("$channel::$event");
    _stream = _instance.on(event,key: _key,channel: channel);
  }
  Future<dynamic> close() => _stream.close();
  FutureOr<bool> publish({
    dynamic data,
    bool volatile =  false
  }) {
    if(channel != DEFAULT_CHANNEL){
      return _instance.trigger(event, channel: channel, data: data, volatile: volatile);
    }
    return false;
  }
}

class _MayaEvent {
  //Id of the event
  String id = '';
  //Event name
  String event = '';
  //Event data
  dynamic data = '';
  String comment = '';
  DateTime time = DateTime.now();

  _MayaEvent({
    dynamic data,
    String? id = '',
    String? event = '',
    String? comment = '',
    DateTime? time,
  }):
    this.id = id ?? '',
    this.data = data ?? '',
    this.event = event ?? '',
    this.comment = comment ?? '',
    this.time = time ?? DateTime.now();

  _MayaEvent.fromData(String data) {
    id = data.split("\n")[0].split('id:')[1];
    event = data.split("\n")[1].split('event:')[1];
    this.data = data.split("\n")[2].split('data:')[1];
  }
  clear() {
    id = "";
    event = "";
    data = "";
    time = DateTime.now();
    comment = "";
  }
}

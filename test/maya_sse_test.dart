import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_maya_sdk/maya.dart';
import 'package:test/test.dart';

import 'init_maya.dart';

main() async {
  test('Listen global event', () async {
    initMaya();
    var event = MayaEvent("collections.find.before");
    Future.delayed(Maya.timeStamp,()async{
      var users = MayaCollection("users");
      var k = Key("Love");
      var docs = await (users.find(
        key: k,
        cache: Duration(hours: 1), // [optional] cache result
        filter: {
          "nom" : {r'$exists' : true}
        }
      ));
    });
    var e = await event.stream.first;
    event.close();
    expect(e.event, "collections.find.before", reason: "Bad Event");
  });
  test('canot publis on global channel', () async {
    initMaya();
    var sent = await MayaPublishEvent("collections.find.before",data: "dossiers");
    expect(sent, false, reason: "Event Must not sent events");
  });
  test('Publish on custom channel', () async {
    initMaya();
    var sent = await MayaPublishEvent("messages/from::to",data: "Je suis un message...", volatile: true);
    expect(sent, true, reason: "Custom Event not sent events");
  });

  test('get published event on custom channel', () async {
    initMaya();
    var event =  MayaEvent("messages/from::to");
    var e = await event.stream.first;
    expect(e.data, "Je suis un message...", reason: "Event Must not sent events");
  });
  test('get wilcard events', () async {
    initMaya();
    var event =  MayaEvent("collections.find.*");
    var e = await event.stream.first;
    expect(RegExp(r"^collections.find.").hasMatch(e.event) , true, reason: "Bad Event");
  });
}


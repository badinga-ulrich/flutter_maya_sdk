import 'package:flutter/foundation.dart';
import 'package:flutter_maya_sdk/maya.dart';
import 'package:test/test.dart';

import 'init_maya.dart';

main() async {
  test('Document', () async {
    initMaya();
    var users = MayaCollection("users");
    var k = Key("Love");
    var req = (users.find(
      key: k,
      cache: Duration(hours: 1), // [optional] cache result
      filter: {
        "nom" : {r'$exists' : true}
      }
    ));
    expect((await req).isEmpty, false, reason: "Document is Empty");
  });
  test('auth', () async {
    initMaya();
    var users = await Maya.instance?.login("test", "test");
    expect(users?.isNotEmpty ?? false, true);
  });
  test('Unauthorized listUsers', () async {
    initMaya();
    try{
    var users = await Maya.instance?.systemUsers();
    throw "Allowed";
    }catch(e){
      expect(e, "Unauthorized");
    }
  });
  test('logout', () async {
    var logout = await Maya.instance?.logout();
    expect(logout, true);
  });
  test('Allowed listUsers', () async {
    initMaya();
    var users = await Maya.instance?.systemUsers();
    expect(users?.isNotEmpty ?? false, true);
  });
}


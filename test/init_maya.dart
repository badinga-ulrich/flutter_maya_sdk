import 'package:flutter_maya_sdk/maya.dart';

void initMaya([String? host]){
  if(Maya.isConfigured) return;
  // Init Maya client
  Maya.init(
    server: Uri.parse(host ?? "http://maya-cms.lo"),
    token: "554caec3e531c67a488a176b02b336",
    defaultFilter: {
      //Global filter
      r"$or": [
        {"delete": false},
        {
          "delete": {r"$exists": false}
        }
      ]
    },
    api: {
      // Collections
      "users": {
        "collection": "dossiers",
        "filter": {
          r"$or" :[
            {"_id" : {r"$like": "c5*"}},
            {"_id" : {r"$like": "d4*"}},
          ]
        },
        "sort": {"dossier": 1},
        "fields": ["nom", "prenom", "montant", "login", "enabled", "_create_by"],
        "map": {
          // change value of a property or set new property in result object
          // you can build string from a template
          "image": "{{SERVER}}{{image.path}}",
          "body": "{{nom}} {{prenom}}"
        },
      },
      "myForm": {"form": "sendmail"},
      "mySingleton": {"singleton": "configurations"},
      "slides": {
        "collection":
            "collection_or_form_name", //collection or form name in Maya
        "limit": 5, // limit when get data from server
        "sort": {
          // sort results
          "_o": 1
        },
        "fields": [
          // fields to gets from the server, other will be ignored
          "title",
          "image",
          "description",
          "backgroundColor",
          "fontColor"
        ],
        "map": {
          // change value of a property or set new property in result object
          // you can build string from a template
          "image": "{{SERVER}}{{image.path}}",
          "body": "{{description}}"
        },
      },
    }
  );
  
}

import 'package:flutter_maya_sdk/maya.dart';

main() async {
// Init Maya client
  Maya.init(
    server: Uri.parse("http://kredigo-gabon.com/app"),
    token: "e8e67e5150dc440c45463e6dfd964c",
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
        "collection": "conventions",
        "sort": {"dossier": 1},
        "fields": ["nom", "prenom", "montant", "login", "enabled", "_create_by"]
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

  print(await MayaCollection("users").find(
    cache: Duration(hours: 1), // [optional] cache result
  ));
}

import 'dart:ui';

import '../register.dart';
import '../ui.dart';




Register register = Register(() {
  
  

  MayaXmlWidget.register("Locale.fromSubtags", (node, key) {
    return Locale.fromSubtags(
        languageCode: (node.s<String>("languageCode", 'und'))!,
        scriptCode: node.s<String>("scriptCode"),
        countryCode: node.s<String>("countryCode"));
  });
});

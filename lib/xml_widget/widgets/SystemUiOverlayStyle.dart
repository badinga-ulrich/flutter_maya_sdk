import 'package:flutter/services.dart';

import '../register.dart';
import '../ui.dart';

import '../enums/Brightness.dart' as _EnumBrightness;



Register register = Register(() {
  _EnumBrightness.register();
  
  

  MayaXmlWidget.register("SystemUiOverlayStyle", (node, key) {
    return SystemUiOverlayStyle(
        systemNavigationBarColor: node.s<Color>("systemNavigationBarColor"),
        systemNavigationBarDividerColor:
            node.s<Color>("systemNavigationBarDividerColor"),
        systemNavigationBarIconBrightness:
            node.s<Brightness>("systemNavigationBarIconBrightness"),
        statusBarColor: node.s<Color>("statusBarColor"),
        statusBarBrightness: node.s<Brightness>("statusBarBrightness"),
        statusBarIconBrightness: node.s<Brightness>("statusBarIconBrightness"));
  });
});

import 'package:flutter/widgets.dart';

import '../register.dart';
import '../ui.dart';




Register register = Register(() {
  
  

  MayaXmlWidget.register("IconThemeData", (node, key) {
    return IconThemeData(
        color: node.s<Color>("color"),
        opacity: node.s<double>("opacity"),
        size: node.s<double>("size"));
  });
});

import 'package:flutter/material.dart';

import '../register.dart';
import '../ui.dart';




Register register = Register(() {
  
  

  MayaXmlWidget.register("Divider", (node, key) {
    return Divider(
        key: key,
        height: node.s<double>("height"),
        thickness: node.s<double>("thickness"),
        indent: node.s<double>("indent"),
        endIndent: node.s<double>("endIndent"),
        color: node.s<Color>("color"));
  });
});

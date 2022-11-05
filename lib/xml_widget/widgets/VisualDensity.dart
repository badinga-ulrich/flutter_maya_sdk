import 'package:flutter/material.dart';

import '../register.dart';
import '../ui.dart';




Register register = Register(() {
  
  

  MayaXmlWidget.register("VisualDensity", (node, key) {
    return VisualDensity(
        horizontal: (node.s<double>("horizontal"))!,
        vertical: (node.s<double>("vertical"))!);
  });
});

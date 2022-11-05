import 'package:flutter/widgets.dart';

import '../register.dart';
import '../ui.dart';




Register register = Register(() {
  
  

  MayaXmlWidget.register("ScrollPhysics", (node, key) {
    return ScrollPhysics(parent: node.s<ScrollPhysics>("parent"));
  });
});

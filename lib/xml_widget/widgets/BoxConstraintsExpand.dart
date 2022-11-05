import 'package:flutter/rendering.dart';

import '../register.dart';
import '../ui.dart';




Register register = Register(() {
  
  

  MayaXmlWidget.register("BoxConstraints.expand", (node, key) {
    return BoxConstraints.expand(
        width: node.s<double>("width"), height: node.s<double>("height"));
  });
});

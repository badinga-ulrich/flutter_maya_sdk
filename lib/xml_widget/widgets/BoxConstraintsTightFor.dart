import 'package:flutter/rendering.dart';

import '../register.dart';
import '../ui.dart';




Register register = Register(() {
  
  

  MayaXmlWidget.register("BoxConstraints.tightFor", (node, key) {
    return BoxConstraints.tightFor(
        width: node.s<double>("width"), height: node.s<double>("height"));
  });
});

import 'package:flutter/widgets.dart';

import '../register.dart';
import '../ui.dart';




Register register = Register(() {
  
  

  MayaXmlWidget.register("BoxConstraints", (node, key) {
    return BoxConstraints(
        minWidth: (node.s<double>("minWidth"))!,
        maxWidth: (node.s<double>("maxWidth"))!,
        minHeight: (node.s<double>("minHeight"))!,
        maxHeight: (node.s<double>("maxHeight"))!);
  });
});

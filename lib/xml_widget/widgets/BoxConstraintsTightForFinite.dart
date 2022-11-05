import 'package:flutter/rendering.dart';

import '../register.dart';
import '../ui.dart';




Register register = Register(() {
  
  

  MayaXmlWidget.register("BoxConstraints.tightForFinite", (node, key) {
    return BoxConstraints.tightForFinite(
        width: (node.s<double>("width", double.infinity))!,
        height: (node.s<double>("height", double.infinity))!);
  });
});

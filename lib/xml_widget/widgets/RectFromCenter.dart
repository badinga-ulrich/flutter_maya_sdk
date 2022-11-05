import 'package:flutter/painting.dart';

import '../register.dart';
import '../ui.dart';


import '../inlines/Offset.dart' as _InlineOffset;


Register register = Register(() {
  
  _InlineOffset.register();
  

  MayaXmlWidget.register("Rect.fromCenter", (node, key) {
    return Rect.fromCenter(
        center: (node.s<Offset>("center"))!,
        width: (node.s<double>("width"))!,
        height: (node.s<double>("height"))!);
  });
});

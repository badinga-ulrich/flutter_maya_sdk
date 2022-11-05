import 'package:flutter/painting.dart';

import '../register.dart';
import '../ui.dart';


import '../inlines/Offset.dart' as _InlineOffset;


Register register = Register(() {
  
  _InlineOffset.register();
  

  MayaXmlWidget.register("Rect.fromCircle", (node, key) {
    return Rect.fromCircle(
        center: (node.s<Offset>("center"))!,
        radius: (node.s<double>("radius"))!);
  });
});

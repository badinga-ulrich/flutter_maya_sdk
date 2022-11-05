import 'package:flutter/widgets.dart';

import '../register.dart';
import '../ui.dart';




Register register = Register(() {
  
  

  MayaXmlWidget.register("ScrollController", (node, key) {
    return ScrollController(
        initialScrollOffset: (node.s<double>("initialScrollOffset", 0.0))!,
        keepScrollOffset: (node.s<bool>("keepScrollOffset"))!,
        debugLabel: node.s<String>("debugLabel"));
  });
});

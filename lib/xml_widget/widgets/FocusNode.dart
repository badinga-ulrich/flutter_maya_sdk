import 'package:flutter/widgets.dart';

import '../register.dart';
import '../ui.dart';




Register register = Register(() {
  
  

  MayaXmlWidget.register("FocusNode", (node, key) {
    return FocusNode(
        debugLabel: node.s<String>("debugLabel"),
        skipTraversal: (node.s<bool>("skipTraversal", false))!,
        canRequestFocus: (node.s<bool>("canRequestFocus", true))!,
        descendantsAreFocusable:
            (node.s<bool>("descendantsAreFocusable", true))!);
  });
});

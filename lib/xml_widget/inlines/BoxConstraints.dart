import 'package:flutter/widgets.dart';

import '../register.dart';
import '../ui.dart';


Register register = Register(() {
  MayaXmlWidget.registerInline(BoxConstraints, "tight", false, (node, method) {
    return BoxConstraints.tight((node.v<Size>(method[0]))!);
  });
  MayaXmlWidget.registerInline(BoxConstraints, "loose", false, (node, method) {
    return BoxConstraints.loose((node.v<Size>(method[0]))!);
  });
});

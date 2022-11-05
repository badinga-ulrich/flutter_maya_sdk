import 'package:flutter/services.dart';

import '../register.dart';
import '../ui.dart';


Register register = Register(() {
  MayaXmlWidget.registerInline(SystemUiOverlayStyle, "light", true, (node, method) {
    return SystemUiOverlayStyle.light;
  });
  MayaXmlWidget.registerInline(SystemUiOverlayStyle, "dark", true, (node, method) {
    return SystemUiOverlayStyle.dark;
  });
});

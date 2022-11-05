import 'package:flutter/widgets.dart';

import '../register.dart';
import '../ui.dart';


Register register = Register(() {
  MayaXmlWidget.registerInline(IconThemeData, "fallback", false, (node, method) {
    return IconThemeData.fallback();
  });
});

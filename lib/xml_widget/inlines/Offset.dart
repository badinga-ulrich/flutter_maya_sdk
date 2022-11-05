import 'package:flutter/material.dart';

import '../register.dart';
import '../ui.dart';


Register register = Register(() {
  MayaXmlWidget.registerInline(Offset, "", false, (node, method) {
    return Offset(method[0].toDouble(), method[1].toDouble());
  });
  MayaXmlWidget.registerInline(Offset, "fromDirection", false, (node, method) {
    return Offset.fromDirection(
        method[0].toDouble(), method[1]?.toDouble() ?? 1.0);
  });
  MayaXmlWidget.registerInline(Offset, "zero", true, (node, method) {
    return Offset.zero;
  });
  MayaXmlWidget.registerInline(Offset, "infinite", true, (node, method) {
    return Offset.infinite;
  });
});

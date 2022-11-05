import 'package:flutter/material.dart';

import '../register.dart';
import '../ui.dart';


Register register = Register(() {
  MayaXmlWidget.registerInline(Rect, "fromLTRB", false, (node, method) {
    return Rect.fromLTRB(method[0].toDouble(), method[1].toDouble(),
        method[2].toDouble(), method[3].toDouble());
  });
  MayaXmlWidget.registerInline(Rect, "fromLTWH", false, (node, method) {
    return Rect.fromLTWH(method[0].toDouble(), method[1].toDouble(),
        method[2].toDouble(), method[3].toDouble());
  });
  MayaXmlWidget.registerInline(Rect, "fromPoints", false, (node, method) {
    return Rect.fromPoints(
        (node.v<Offset>(method[0]))!, (node.v<Offset>(method[1]))!);
  });
  MayaXmlWidget.registerInline(Rect, "zero", true, (node, method) {
    return Rect.zero;
  });
  MayaXmlWidget.registerInline(Rect, "largest", true, (node, method) {
    return Rect.largest;
  });
});

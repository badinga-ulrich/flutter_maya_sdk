import 'package:flutter/material.dart';

import '../register.dart';
import '../ui.dart';


Register register = Register(() {
  MayaXmlWidget.registerInline(MouseCursor, "defer", true, (node, method) {
    return MouseCursor.defer;
  });
  MayaXmlWidget.registerInline(MouseCursor, "uncontrolled", true, (node, method) {
    return MouseCursor.uncontrolled;
  });
});

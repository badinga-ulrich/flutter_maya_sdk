import 'package:flutter/material.dart';

import '../register.dart';
import '../ui.dart';


Register register = Register(() {
  MayaXmlWidget.registerInline(EdgeInsetsGeometry, "infinity", true,
      (node, method) {
    return EdgeInsetsGeometry.infinity;
  });
});

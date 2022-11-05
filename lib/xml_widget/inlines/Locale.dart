import 'package:flutter/material.dart';

import '../register.dart';
import '../ui.dart';


Register register = Register(() {
  MayaXmlWidget.registerInline(Locale, "", false, (node, method) {
    return Locale(method[0].toString(), method[1]?.toString());
  });
});

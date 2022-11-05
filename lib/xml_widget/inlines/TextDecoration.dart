import 'package:flutter/material.dart';

import '../register.dart';
import '../ui.dart';


Register register = Register(() {
  MayaXmlWidget.registerInline(TextDecoration, "none", true, (node, method) {
    return TextDecoration.none;
  });
  MayaXmlWidget.registerInline(TextDecoration, "underline", true, (node, method) {
    return TextDecoration.underline;
  });
  MayaXmlWidget.registerInline(TextDecoration, "overline", true, (node, method) {
    return TextDecoration.overline;
  });
  MayaXmlWidget.registerInline(TextDecoration, "lineThrough", true, (node, method) {
    return TextDecoration.lineThrough;
  });
});

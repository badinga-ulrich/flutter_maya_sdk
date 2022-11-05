import 'package:flutter/material.dart';

import '../register.dart';
import '../ui.dart';


Register register = Register(() {
  MayaXmlWidget.registerInline(FontWeight, "w100", true, (node, method) {
    return FontWeight.w100;
  });
  MayaXmlWidget.registerInline(FontWeight, "w200", true, (node, method) {
    return FontWeight.w200;
  });
  MayaXmlWidget.registerInline(FontWeight, "w300", true, (node, method) {
    return FontWeight.w300;
  });
  MayaXmlWidget.registerInline(FontWeight, "w400", true, (node, method) {
    return FontWeight.w400;
  });
  MayaXmlWidget.registerInline(FontWeight, "w500", true, (node, method) {
    return FontWeight.w500;
  });
  MayaXmlWidget.registerInline(FontWeight, "w600", true, (node, method) {
    return FontWeight.w600;
  });
  MayaXmlWidget.registerInline(FontWeight, "w700", true, (node, method) {
    return FontWeight.w700;
  });
  MayaXmlWidget.registerInline(FontWeight, "w800", true, (node, method) {
    return FontWeight.w800;
  });
  MayaXmlWidget.registerInline(FontWeight, "w900", true, (node, method) {
    return FontWeight.w900;
  });
  MayaXmlWidget.registerInline(FontWeight, "normal", true, (node, method) {
    return FontWeight.normal;
  });
  MayaXmlWidget.registerInline(FontWeight, "bold", true, (node, method) {
    return FontWeight.bold;
  });
});

import 'package:flutter/material.dart';

import '../register.dart';
import '../ui.dart';


Register register = Register(() {
  MayaXmlWidget.registerInline(VisualDensity, "standard", true, (node, method) {
    return VisualDensity.standard;
  });
  MayaXmlWidget.registerInline(VisualDensity, "comfortable", true, (node, method) {
    return VisualDensity.comfortable;
  });
  MayaXmlWidget.registerInline(VisualDensity, "compact", true, (node, method) {
    return VisualDensity.compact;
  });
  MayaXmlWidget.registerInline(VisualDensity, "adaptivePlatformDensity", true,
      (node, method) {
    return VisualDensity.adaptivePlatformDensity;
  });
});

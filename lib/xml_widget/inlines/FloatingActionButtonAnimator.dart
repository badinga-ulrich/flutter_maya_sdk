import 'package:flutter/material.dart';

import '../register.dart';
import '../ui.dart';


Register register = Register(() {
  MayaXmlWidget.registerInline(FloatingActionButtonAnimator, "scaling", true,
      (node, method) {
    return FloatingActionButtonAnimator.scaling;
  });
});

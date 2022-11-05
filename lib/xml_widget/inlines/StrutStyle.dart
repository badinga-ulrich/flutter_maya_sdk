import 'package:flutter/widgets.dart';

import '../register.dart';
import '../ui.dart';


Register register = Register(() {
  MayaXmlWidget.registerInline(StrutStyle, "disabled", true, (node, method) {
    return StrutStyle.disabled;
  });
});

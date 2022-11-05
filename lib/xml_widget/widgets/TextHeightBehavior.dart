import 'package:flutter/widgets.dart';

import '../register.dart';
import '../ui.dart';

import '../enums/TextLeadingDistribution.dart' as _EnumTextLeadingDistribution;



Register register = Register(() {
  _EnumTextLeadingDistribution.register();
  
  

  MayaXmlWidget.register("TextHeightBehavior", (node, key) {
    return TextHeightBehavior(
        applyHeightToFirstAscent: (node.s<bool>("applyHeightToFirstAscent"))!,
        applyHeightToLastDescent: (node.s<bool>("applyHeightToLastDescent"))!,
        leadingDistribution:
            (node.s<TextLeadingDistribution>("leadingDistribution"))!);
  });
});

import 'package:flutter/painting.dart';

import '../register.dart';
import '../ui.dart';

import '../enums/FontStyle.dart' as _EnumFontStyle;
import '../enums/TextLeadingDistribution.dart' as _EnumTextLeadingDistribution;

import '../inlines/FontWeight.dart' as _InlineFontWeight;


Register register = Register(() {
  _EnumFontStyle.register();
  _EnumTextLeadingDistribution.register();
  
  _InlineFontWeight.register();
  

  MayaXmlWidget.register("StrutStyle.fromTextStyle", (node, key) {
    return StrutStyle.fromTextStyle(
        ((node.s<TextStyle?>("arg:0") ?? node.child<TextStyle>()))!,
        fontFamily: node.s<String>("fontFamily"),
        fontFamilyFallback: node.array<String>("fontFamilyFallback"),
        fontSize: node.s<double>("fontSize"),
        height: node.s<double>("height"),
        leadingDistribution:
            node.s<TextLeadingDistribution>("leadingDistribution"),
        leading: node.s<double>("leading"),
        fontWeight: node.s<FontWeight>("fontWeight"),
        fontStyle: node.s<FontStyle>("fontStyle"),
        forceStrutHeight: node.s<bool>("forceStrutHeight"),
        debugLabel: node.s<String>("debugLabel"),
        package: node.s<String>("package"));
  });
});

import 'package:flutter/widgets.dart';
import 'dart:ui';

import '../register.dart';
import '../ui.dart';

import '../enums/TextBaseline.dart' as _EnumTextBaseline;
import '../enums/FontStyle.dart' as _EnumFontStyle;
import '../enums/TextLeadingDistribution.dart' as _EnumTextLeadingDistribution;
import '../enums/TextDecorationStyle.dart' as _EnumTextDecorationStyle;

import '../inlines/FontWeight.dart' as _InlineFontWeight;
import '../inlines/Locale.dart' as _InlineLocale;
import '../inlines/TextDecoration.dart' as _InlineTextDecoration;


Register register = Register(() {
  _EnumTextBaseline.register();
  _EnumFontStyle.register();
  _EnumTextLeadingDistribution.register();
  _EnumTextDecorationStyle.register();
  
  _InlineFontWeight.register();
  _InlineLocale.register();
  _InlineTextDecoration.register();
  

  MayaXmlWidget.register("TextStyle", (node, key) {
    return TextStyle(
        inherit: node.s<bool>("inherit") ?? true,
        color: node.s<Color>("color"),
        backgroundColor: node.s<Color>("backgroundColor"),
        fontSize: node.s<double>("fontSize"),
        fontWeight: node.s<FontWeight>("fontWeight"),
        fontStyle: node.s<FontStyle>("fontStyle"),
        letterSpacing: node.s<double>("letterSpacing"),
        wordSpacing: node.s<double>("wordSpacing"),
        textBaseline: node.s<TextBaseline>("textBaseline"),
        height: node.s<double>("height"),
        leadingDistribution:
            node.s<TextLeadingDistribution>("leadingDistribution"),
        locale: node.s<Locale>("locale"),
        foreground: node.s<Paint>("foreground"),
        background: node.s<Paint>("background"),
        shadows: node.array<Shadow>("shadows"),
        fontFeatures: node.array<FontFeature>("fontFeatures"),
        decoration: node.s<TextDecoration>("decoration"),
        decorationColor: node.s<Color>("decorationColor"),
        decorationStyle: node.s<TextDecorationStyle>("decorationStyle"),
        decorationThickness: node.s<double>("decorationThickness"),
        debugLabel: node.s<String>("debugLabel"),
        fontFamily: node.s<String>("fontFamily"),
        fontFamilyFallback: node.array<String>("fontFamilyFallback"),
        package: node.s<String>("package"));
  });
});

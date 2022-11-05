import 'package:flutter/material.dart';

import '../register.dart';
import '../ui.dart';




Register register = Register(() {
  
  

  MayaXmlWidget.register("TextTheme", (node, key) {
    return TextTheme(
        headline1: node.s<TextStyle>("headline1"),
        headline2: node.s<TextStyle>("headline2"),
        headline3: node.s<TextStyle>("headline3"),
        headline4: node.s<TextStyle>("headline4"),
        headline5: node.s<TextStyle>("headline5"),
        headline6: node.s<TextStyle>("headline6"),
        subtitle1: node.s<TextStyle>("subtitle1"),
        subtitle2: node.s<TextStyle>("subtitle2"),
        bodyText1: node.s<TextStyle>("bodyText1"),
        bodyText2: node.s<TextStyle>("bodyText2"),
        caption: node.s<TextStyle>("caption"),
        button: node.s<TextStyle>("button"),
        overline: node.s<TextStyle>("overline"));
  });
});

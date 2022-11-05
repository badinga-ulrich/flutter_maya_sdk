import 'package:flutter/widgets.dart';

import '../register.dart';
import '../ui.dart';

import '../enums/TextDirection.dart' as _EnumTextDirection;
import '../enums/TextAlign.dart' as _EnumTextAlign;
import '../enums/TextOverflow.dart' as _EnumTextOverflow;
import '../enums/TextWidthBasis.dart' as _EnumTextWidthBasis;

import '../inlines/Locale.dart' as _InlineLocale;
import '../inlines/StrutStyle.dart' as _InlineStrutStyle;


Register register = Register(() {
  _EnumTextDirection.register();
  _EnumTextAlign.register();
  _EnumTextOverflow.register();
  _EnumTextWidthBasis.register();
  
  _InlineLocale.register();
  _InlineStrutStyle.register();
  

  MayaXmlWidget.register("Text", (node, key) {
    return Text(((node.s<String?>("arg:0") ?? node.t<String>()))!,
        key: key,
        style: node.s<TextStyle>("style"),
        strutStyle: node.s<StrutStyle>("strutStyle"),
        textAlign: node.s<TextAlign>("textAlign"),
        textDirection: node.s<TextDirection>("textDirection"),
        locale: node.s<Locale>("locale"),
        softWrap: node.s<bool>("softWrap"),
        overflow: node.s<TextOverflow>("overflow"),
        textScaleFactor: node.s<double>("textScaleFactor"),
        maxLines: node.s<int>("maxLines"),
        semanticsLabel: node.s<String>("semanticsLabel"),
        textWidthBasis: node.s<TextWidthBasis>("textWidthBasis"),
        textHeightBehavior: node.s<TextHeightBehavior>("textHeightBehavior"));
  });
});

import 'package:flutter/material.dart';

import '../register.dart';
import '../ui.dart';

import '../enums/ButtonTextTheme.dart' as _EnumButtonTextTheme;
import '../enums/Brightness.dart' as _EnumBrightness;
import '../enums/Clip.dart' as _EnumClip;
import '../enums/MaterialTapTargetSize.dart' as _EnumMaterialTapTargetSize;

import '../inlines/MouseCursor.dart' as _InlineMouseCursor;
import '../inlines/EdgeInsetsGeometry.dart' as _InlineEdgeInsetsGeometry;
import '../inlines/VisualDensity.dart' as _InlineVisualDensity;
import '../inlines/Duration.dart' as _InlineDuration;


Register register = Register(() {
  _EnumButtonTextTheme.register();
  _EnumBrightness.register();
  _EnumClip.register();
  _EnumMaterialTapTargetSize.register();
  
  _InlineMouseCursor.register();
  _InlineEdgeInsetsGeometry.register();
  _InlineVisualDensity.register();
  _InlineDuration.register();
  

  MayaXmlWidget.register("MaterialButton", (node, key) {
    return MaterialButton(
        key: key,
        onPressed: node.s<void Function()>("onPressed"),
        onLongPress: node.s<void Function()>("onLongPress"),
        onHighlightChanged: node.s<void Function(bool)>("onHighlightChanged"),
        mouseCursor: node.s<MouseCursor>("mouseCursor"),
        textTheme: node.s<ButtonTextTheme>("textTheme"),
        textColor: node.s<Color>("textColor"),
        disabledTextColor: node.s<Color>("disabledTextColor"),
        color: node.s<Color>("color"),
        disabledColor: node.s<Color>("disabledColor"),
        focusColor: node.s<Color>("focusColor"),
        hoverColor: node.s<Color>("hoverColor"),
        highlightColor: node.s<Color>("highlightColor"),
        splashColor: node.s<Color>("splashColor"),
        colorBrightness: node.s<Brightness>("colorBrightness"),
        elevation: node.s<double>("elevation"),
        focusElevation: node.s<double>("focusElevation"),
        hoverElevation: node.s<double>("hoverElevation"),
        highlightElevation: node.s<double>("highlightElevation"),
        disabledElevation: node.s<double>("disabledElevation"),
        padding: node.s<EdgeInsetsGeometry>("padding"),
        visualDensity: node.s<VisualDensity>("visualDensity"),
        shape: node.s<ShapeBorder>("shape"),
        clipBehavior: (node.s<Clip>("clipBehavior"))!,
        focusNode: node.s<FocusNode>("focusNode"),
        autofocus: (node.s<bool>("autofocus"))!,
        materialTapTargetSize:
            node.s<MaterialTapTargetSize>("materialTapTargetSize"),
        animationDuration: node.s<Duration>("animationDuration"),
        minWidth: node.s<double>("minWidth"),
        height: node.s<double>("height"),
        enableFeedback: (node.s<bool>("enableFeedback"))!,
        child: node.child<Widget>());
  });
});

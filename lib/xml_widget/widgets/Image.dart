import 'package:flutter/widgets.dart';

import '../register.dart';
import '../ui.dart';

import '../enums/BlendMode.dart' as _EnumBlendMode;
import '../enums/BoxFit.dart' as _EnumBoxFit;
import '../enums/ImageRepeat.dart' as _EnumImageRepeat;
import '../enums/FilterQuality.dart' as _EnumFilterQuality;

import '../inlines/Rect.dart' as _InlineRect;


Register register = Register(() {
  _EnumBlendMode.register();
  _EnumBoxFit.register();
  _EnumImageRepeat.register();
  _EnumFilterQuality.register();
  
  _InlineRect.register();
  

  MayaXmlWidget.register("Image", (node, key) {
    return Image(
        key: key,
        image: (node.s<ImageProvider<Object>>("image"))!,
        frameBuilder: node.s<Widget Function(BuildContext, Widget, int?, bool)>(
            "frameBuilder"),
        loadingBuilder:
            node.s<Widget Function(BuildContext, Widget, ImageChunkEvent?)>(
                "loadingBuilder"),
        errorBuilder:
            node.s<Widget Function(BuildContext, Object, StackTrace?)>(
                "errorBuilder"),
        semanticLabel: node.s<String>("semanticLabel"),
        excludeFromSemantics: (node.s<bool>("excludeFromSemantics"))!,
        width: node.s<double>("width"),
        height: node.s<double>("height"),
        color: node.s<Color>("color"),
        colorBlendMode: node.s<BlendMode>("colorBlendMode"),
        fit: node.s<BoxFit>("fit"),
        alignment: (node.s<AlignmentGeometry>("alignment"))!,
        repeat: (node.s<ImageRepeat>("repeat"))!,
        centerSlice: node.s<Rect>("centerSlice"),
        matchTextDirection: (node.s<bool>("matchTextDirection"))!,
        gaplessPlayback: (node.s<bool>("gaplessPlayback"))!,
        isAntiAlias: (node.s<bool>("isAntiAlias"))!,
        filterQuality: (node.s<FilterQuality>("filterQuality"))!);
  });
});

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
  

  MayaXmlWidget.register("Image.network", (node, key) {
    return Image.network(((node.s<String?>("arg:0") ?? node.t<String>()))!,
        key: key,
        scale: (node.s<double>("scale", 1.0))!,
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
        filterQuality: (node.s<FilterQuality>("filterQuality"))!,
        isAntiAlias: (node.s<bool>("isAntiAlias"))!,
        headers: node.s<Map<String, String>>("headers"),
        cacheWidth: node.s<int>("cacheWidth"),
        cacheHeight: node.s<int>("cacheHeight"));
  });
});

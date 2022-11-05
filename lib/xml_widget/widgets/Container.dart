import 'package:flutter/widgets.dart';

import '../register.dart';
import '../ui.dart';

import '../enums/Clip.dart' as _EnumClip;

import '../inlines/EdgeInsetsGeometry.dart' as _InlineEdgeInsetsGeometry;
import '../inlines/BoxConstraints.dart' as _InlineBoxConstraints;
import '../inlines/Matrix4.dart' as _InlineMatrix4;


Register register = Register(() {
  _EnumClip.register();
  
  _InlineEdgeInsetsGeometry.register();
  _InlineBoxConstraints.register();
  _InlineMatrix4.register();
  

  MayaXmlWidget.register("Container", (node, key) {
    return Container(
        key: key,
        alignment: node.s<AlignmentGeometry>("alignment"),
        padding: node.s<EdgeInsetsGeometry>("padding"),
        color: node.s<Color>("color"),
        decoration: node.s<Decoration>("decoration"),
        foregroundDecoration: node.s<Decoration>("foregroundDecoration"),
        width: node.s<double>("width"),
        height: node.s<double>("height"),
        constraints: node.s<BoxConstraints>("constraints"),
        margin: node.s<EdgeInsetsGeometry>("margin"),
        transform: node.s<Matrix4>("transform"),
        transformAlignment: node.s<AlignmentGeometry>("transformAlignment"),
        child: node.child<Widget>(),
        clipBehavior: (node.s<Clip>("clipBehavior"))!);
  });
});

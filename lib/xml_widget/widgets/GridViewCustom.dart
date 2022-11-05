import 'package:flutter/widgets.dart';
import 'package:flutter/gestures.dart';

import '../register.dart';
import '../ui.dart';

import '../enums/Clip.dart' as _EnumClip;
import '../enums/DragStartBehavior.dart' as _EnumDragStartBehavior;
import '../enums/Axis.dart' as _EnumAxis;
import '../enums/ScrollViewKeyboardDismissBehavior.dart' as _EnumScrollViewKeyboardDismissBehavior;

import '../inlines/EdgeInsetsGeometry.dart' as _InlineEdgeInsetsGeometry;


Register register = Register(() {
  _EnumClip.register();
  _EnumDragStartBehavior.register();
  _EnumAxis.register();
  _EnumScrollViewKeyboardDismissBehavior.register();
  
  _InlineEdgeInsetsGeometry.register();
  

  MayaXmlWidget.register("GridView.custom", (node, key) {
    return GridView.custom(
        key: key,
        scrollDirection: (node.s<Axis>("scrollDirection", Axis.vertical))!,
        reverse: (node.s<bool>("reverse", false))!,
        controller: node.s<ScrollController>("controller"),
        primary: node.s<bool>("primary"),
        physics: node.s<ScrollPhysics>("physics"),
        shrinkWrap: (node.s<bool>("shrinkWrap", false))!,
        padding: node.s<EdgeInsetsGeometry>("padding"),
        gridDelegate: (node.s<SliverGridDelegate>("gridDelegate"))!,
        childrenDelegate: (node.s<SliverChildDelegate>("childrenDelegate"))!,
        cacheExtent: node.s<double>("cacheExtent"),
        semanticChildCount: node.s<int>("semanticChildCount"),
        dragStartBehavior: (node.s<DragStartBehavior>(
            "dragStartBehavior", DragStartBehavior.start))!,
        keyboardDismissBehavior: (node.s<ScrollViewKeyboardDismissBehavior>(
            "keyboardDismissBehavior",
            ScrollViewKeyboardDismissBehavior.manual))!,
        restorationId: node.s<String>("restorationId"),
        clipBehavior: (node.s<Clip>("clipBehavior", Clip.hardEdge))!);
  });
});

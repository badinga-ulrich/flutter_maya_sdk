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
  

  MayaXmlWidget.register("GridView.count", (node, key) {
    return GridView.count(
        key: key,
        scrollDirection: (node.s<Axis>("scrollDirection", Axis.vertical))!,
        reverse: (node.s<bool>("reverse", false))!,
        controller: node.s<ScrollController>("controller"),
        primary: node.s<bool>("primary"),
        physics: node.s<ScrollPhysics>("physics"),
        shrinkWrap: (node.s<bool>("shrinkWrap", false))!,
        padding: node.s<EdgeInsetsGeometry>("padding"),
        crossAxisCount: (node.s<int>("crossAxisCount"))!,
        mainAxisSpacing: (node.s<double>("mainAxisSpacing", 0.0))!,
        crossAxisSpacing: (node.s<double>("crossAxisSpacing", 0.0))!,
        childAspectRatio: (node.s<double>("childAspectRatio", 1.0))!,
        addAutomaticKeepAlives: (node.s<bool>("addAutomaticKeepAlives", true))!,
        addRepaintBoundaries: (node.s<bool>("addRepaintBoundaries", true))!,
        addSemanticIndexes: (node.s<bool>("addSemanticIndexes", true))!,
        cacheExtent: node.s<double>("cacheExtent"),
        children: node.children<Widget>(),
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

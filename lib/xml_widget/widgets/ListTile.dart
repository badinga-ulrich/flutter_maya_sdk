import 'package:flutter/material.dart';

import '../register.dart';
import '../ui.dart';


import '../inlines/MouseCursor.dart' as _InlineMouseCursor;
import '../inlines/EdgeInsetsGeometry.dart' as _InlineEdgeInsetsGeometry;
import '../inlines/VisualDensity.dart' as _InlineVisualDensity;


Register register = Register(() {
  
  _InlineMouseCursor.register();
  _InlineEdgeInsetsGeometry.register();
  _InlineVisualDensity.register();
  

  MayaXmlWidget.register("ListTile", (node, key) {
    return ListTile(
        key: key,
        leading: node.s<Widget>("leading"),
        title: node.s<Widget>("title"),
        subtitle: node.s<Widget>("subtitle"),
        trailing: node.s<Widget>("trailing"),
        isThreeLine: (node.s<bool>("isThreeLine"))!,
        dense: node.s<bool>("dense"),
        visualDensity: node.s<VisualDensity>("visualDensity"),
        shape: node.s<ShapeBorder>("shape"),
        contentPadding: node.s<EdgeInsetsGeometry>("contentPadding"),
        enabled: (node.s<bool>("enabled"))!,
        onTap: node.s<void Function()>("onTap"),
        onLongPress: node.s<void Function()>("onLongPress"),
        mouseCursor: node.s<MouseCursor>("mouseCursor"),
        selected: (node.s<bool>("selected"))!,
        focusColor: node.s<Color>("focusColor"),
        hoverColor: node.s<Color>("hoverColor"),
        focusNode: node.s<FocusNode>("focusNode"),
        autofocus: (node.s<bool>("autofocus"))!,
        tileColor: node.s<Color>("tileColor"),
        selectedTileColor: node.s<Color>("selectedTileColor"),
        enableFeedback: node.s<bool>("enableFeedback"),
        horizontalTitleGap: node.s<double>("horizontalTitleGap"),
        minVerticalPadding: node.s<double>("minVerticalPadding"),
        minLeadingWidth: node.s<double>("minLeadingWidth"));
  });
});

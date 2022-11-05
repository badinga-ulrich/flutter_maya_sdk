import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../register.dart';
import '../ui.dart';

import '../enums/Brightness.dart' as _EnumBrightness;

import '../inlines/IconThemeData.dart' as _InlineIconThemeData;
import '../inlines/SystemUiOverlayStyle.dart' as _InlineSystemUiOverlayStyle;


Register register = Register(() {
  _EnumBrightness.register();
  
  _InlineIconThemeData.register();
  _InlineSystemUiOverlayStyle.register();
  

  MayaXmlWidget.register("AppBar", (node, key) {
    return AppBar(
        key: key,
        leading: node.s<Widget>("leading"),
        automaticallyImplyLeading: (node.s<bool>("automaticallyImplyLeading"))!,
        title: node.s<Widget>("title"),
        actions: node.array<Widget>("actions"),
        flexibleSpace: node.s<Widget>("flexibleSpace"),
        bottom: node.s<PreferredSizeWidget>("bottom"),
        elevation: node.s<double>("elevation"),
        shadowColor: node.s<Color>("shadowColor"),
        shape: node.s<ShapeBorder>("shape"),
        backgroundColor: node.s<Color>("backgroundColor"),
        foregroundColor: node.s<Color>("foregroundColor"),
        brightness: node.s<Brightness>("brightness"),
        iconTheme: node.s<IconThemeData>("iconTheme"),
        actionsIconTheme: node.s<IconThemeData>("actionsIconTheme"),
        textTheme: node.s<TextTheme>("textTheme"),
        primary: (node.s<bool>("primary"))!,
        centerTitle: node.s<bool>("centerTitle"),
        excludeHeaderSemantics: (node.s<bool>("excludeHeaderSemantics"))!,
        titleSpacing: node.s<double>("titleSpacing"),
        toolbarOpacity: (node.s<double>("toolbarOpacity"))!,
        bottomOpacity: (node.s<double>("bottomOpacity"))!,
        toolbarHeight: node.s<double>("toolbarHeight"),
        leadingWidth: node.s<double>("leadingWidth"),
        backwardsCompatibility: node.s<bool>("backwardsCompatibility"),
        toolbarTextStyle: node.s<TextStyle>("toolbarTextStyle"),
        titleTextStyle: node.s<TextStyle>("titleTextStyle"),
        systemOverlayStyle: node.s<SystemUiOverlayStyle>("systemOverlayStyle"));
  });
});

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import '../register.dart';
import '../ui.dart';

import '../enums/DragStartBehavior.dart' as _EnumDragStartBehavior;

import '../inlines/FloatingActionButtonLocation.dart' as _InlineFloatingActionButtonLocation;
import '../inlines/FloatingActionButtonAnimator.dart' as _InlineFloatingActionButtonAnimator;


Register register = Register(() {
  _EnumDragStartBehavior.register();
  
  _InlineFloatingActionButtonLocation.register();
  _InlineFloatingActionButtonAnimator.register();
  

  MayaXmlWidget.register("Scaffold", (node, key) {
    return Scaffold(
        key: key,
        appBar: node.s<PreferredSizeWidget>("appBar"),
        body: node.s<Widget>("body"),
        floatingActionButton: node.s<Widget>("floatingActionButton"),
        floatingActionButtonLocation: node
            .s<FloatingActionButtonLocation>("floatingActionButtonLocation"),
        floatingActionButtonAnimator: node
            .s<FloatingActionButtonAnimator>("floatingActionButtonAnimator"),
        persistentFooterButtons: node.array<Widget>("persistentFooterButtons"),
        drawer: node.s<Widget>("drawer"),
        onDrawerChanged: node.s<void Function(bool)>("onDrawerChanged"),
        endDrawer: node.s<Widget>("endDrawer"),
        onEndDrawerChanged: node.s<void Function(bool)>("onEndDrawerChanged"),
        bottomNavigationBar: node.s<Widget>("bottomNavigationBar"),
        bottomSheet: node.s<Widget>("bottomSheet"),
        backgroundColor: node.s<Color>("backgroundColor"),
        resizeToAvoidBottomInset: node.s<bool>("resizeToAvoidBottomInset"),
        primary: (node.s<bool>("primary"))!,
        drawerDragStartBehavior:
            (node.s<DragStartBehavior>("drawerDragStartBehavior"))!,
        extendBody: (node.s<bool>("extendBody"))!,
        extendBodyBehindAppBar: (node.s<bool>("extendBodyBehindAppBar"))!,
        drawerScrimColor: node.s<Color>("drawerScrimColor"),
        drawerEdgeDragWidth: node.s<double>("drawerEdgeDragWidth"),
        drawerEnableOpenDragGesture:
            (node.s<bool>("drawerEnableOpenDragGesture"))!,
        endDrawerEnableOpenDragGesture:
            (node.s<bool>("endDrawerEnableOpenDragGesture"))!,
        restorationId: node.s<String>("restorationId"));
  });
});

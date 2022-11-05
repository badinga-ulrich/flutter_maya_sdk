import 'package:flutter/material.dart';

import '../register.dart';
import '../ui.dart';


Register register = Register(() {
  MayaXmlWidget.registerInline(FloatingActionButtonLocation, "startTop", true,
      (node, method) {
    return FloatingActionButtonLocation.startTop;
  });
  MayaXmlWidget.registerInline(FloatingActionButtonLocation, "miniStartTop", true,
      (node, method) {
    return FloatingActionButtonLocation.miniStartTop;
  });
  MayaXmlWidget.registerInline(FloatingActionButtonLocation, "centerTop", true,
      (node, method) {
    return FloatingActionButtonLocation.centerTop;
  });
  MayaXmlWidget.registerInline(FloatingActionButtonLocation, "miniCenterTop", true,
      (node, method) {
    return FloatingActionButtonLocation.miniCenterTop;
  });
  MayaXmlWidget.registerInline(FloatingActionButtonLocation, "endTop", true,
      (node, method) {
    return FloatingActionButtonLocation.endTop;
  });
  MayaXmlWidget.registerInline(FloatingActionButtonLocation, "miniEndTop", true,
      (node, method) {
    return FloatingActionButtonLocation.miniEndTop;
  });
  MayaXmlWidget.registerInline(FloatingActionButtonLocation, "startFloat", true,
      (node, method) {
    return FloatingActionButtonLocation.startFloat;
  });
  MayaXmlWidget.registerInline(FloatingActionButtonLocation, "miniStartFloat", true,
      (node, method) {
    return FloatingActionButtonLocation.miniStartFloat;
  });
  MayaXmlWidget.registerInline(FloatingActionButtonLocation, "centerFloat", true,
      (node, method) {
    return FloatingActionButtonLocation.centerFloat;
  });
  MayaXmlWidget.registerInline(
      FloatingActionButtonLocation, "miniCenterFloat", true, (node, method) {
    return FloatingActionButtonLocation.miniCenterFloat;
  });
  MayaXmlWidget.registerInline(FloatingActionButtonLocation, "endFloat", true,
      (node, method) {
    return FloatingActionButtonLocation.endFloat;
  });
  MayaXmlWidget.registerInline(FloatingActionButtonLocation, "miniEndFloat", true,
      (node, method) {
    return FloatingActionButtonLocation.miniEndFloat;
  });
  MayaXmlWidget.registerInline(FloatingActionButtonLocation, "startDocked", true,
      (node, method) {
    return FloatingActionButtonLocation.startDocked;
  });
  MayaXmlWidget.registerInline(
      FloatingActionButtonLocation, "miniStartDocked", true, (node, method) {
    return FloatingActionButtonLocation.miniStartDocked;
  });
  MayaXmlWidget.registerInline(FloatingActionButtonLocation, "centerDocked", true,
      (node, method) {
    return FloatingActionButtonLocation.centerDocked;
  });
  MayaXmlWidget.registerInline(
      FloatingActionButtonLocation, "miniCenterDocked", true, (node, method) {
    return FloatingActionButtonLocation.miniCenterDocked;
  });
  MayaXmlWidget.registerInline(FloatingActionButtonLocation, "endDocked", true,
      (node, method) {
    return FloatingActionButtonLocation.endDocked;
  });
  MayaXmlWidget.registerInline(FloatingActionButtonLocation, "miniEndDocked", true,
      (node, method) {
    return FloatingActionButtonLocation.miniEndDocked;
  });
});

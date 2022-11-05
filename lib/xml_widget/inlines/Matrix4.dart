import 'package:vector_math/vector_math_64.dart';
import 'dart:typed_data';

import '../register.dart';
import '../ui.dart';


Register register = Register(() {
  MayaXmlWidget.registerInline(Matrix4, "", false, (node, method) {
    return Matrix4(
        method[0].toDouble(),
        method[1].toDouble(),
        method[2].toDouble(),
        method[3].toDouble(),
        method[4].toDouble(),
        method[5].toDouble(),
        method[6].toDouble(),
        method[7].toDouble(),
        method[8].toDouble(),
        method[9].toDouble(),
        method[10].toDouble(),
        method[11].toDouble(),
        method[12].toDouble(),
        method[13].toDouble(),
        method[14].toDouble(),
        method[15].toDouble());
  });
  MayaXmlWidget.registerInline(Matrix4, "zero", false, (node, method) {
    return Matrix4.zero();
  });
  MayaXmlWidget.registerInline(Matrix4, "identity", false, (node, method) {
    return Matrix4.identity();
  });
  MayaXmlWidget.registerInline(Matrix4, "copy", false, (node, method) {
    return Matrix4.copy((node.v<Matrix4>(method[0]))!);
  });
  MayaXmlWidget.registerInline(Matrix4, "inverted", false, (node, method) {
    return Matrix4.inverted((node.v<Matrix4>(method[0]))!);
  });
  MayaXmlWidget.registerInline(Matrix4, "columns", false, (node, method) {
    return Matrix4.columns(
        (node.v<Vector4>(method[0]))!,
        (node.v<Vector4>(method[1]))!,
        (node.v<Vector4>(method[2]))!,
        (node.v<Vector4>(method[3]))!);
  });
  MayaXmlWidget.registerInline(Matrix4, "outer", false, (node, method) {
    return Matrix4.outer(
        (node.v<Vector4>(method[0]))!, (node.v<Vector4>(method[1]))!);
  });
  MayaXmlWidget.registerInline(Matrix4, "rotationX", false, (node, method) {
    return Matrix4.rotationX(method[0].toDouble());
  });
  MayaXmlWidget.registerInline(Matrix4, "rotationY", false, (node, method) {
    return Matrix4.rotationY(method[0].toDouble());
  });
  MayaXmlWidget.registerInline(Matrix4, "rotationZ", false, (node, method) {
    return Matrix4.rotationZ(method[0].toDouble());
  });
  MayaXmlWidget.registerInline(Matrix4, "translation", false, (node, method) {
    return Matrix4.translation((node.v<Vector3>(method[0]))!);
  });
  MayaXmlWidget.registerInline(Matrix4, "translationValues", false, (node, method) {
    return Matrix4.translationValues(
        method[0].toDouble(), method[1].toDouble(), method[2].toDouble());
  });
  MayaXmlWidget.registerInline(Matrix4, "diagonal3", false, (node, method) {
    return Matrix4.diagonal3((node.v<Vector3>(method[0]))!);
  });
  MayaXmlWidget.registerInline(Matrix4, "diagonal3Values", false, (node, method) {
    return Matrix4.diagonal3Values(
        method[0].toDouble(), method[1].toDouble(), method[2].toDouble());
  });
  MayaXmlWidget.registerInline(Matrix4, "skewX", false, (node, method) {
    return Matrix4.skewX(method[0].toDouble());
  });
  MayaXmlWidget.registerInline(Matrix4, "skewY", false, (node, method) {
    return Matrix4.skewY(method[0].toDouble());
  });
  MayaXmlWidget.registerInline(Matrix4, "skew", false, (node, method) {
    return Matrix4.skew(method[0].toDouble(), method[1].toDouble());
  });
  MayaXmlWidget.registerInline(Matrix4, "fromFloat64List", false, (node, method) {
    return Matrix4.fromFloat64List((node.v<Float64List>(method[0]))!);
  });
  MayaXmlWidget.registerInline(Matrix4, "compose", false, (node, method) {
    return Matrix4.compose((node.v<Vector3>(method[0]))!,
        (node.v<Quaternion>(method[1]))!, (node.v<Vector3>(method[2]))!);
  });
});

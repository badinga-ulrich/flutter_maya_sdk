import 'package:vector_math/vector_math_64.dart';
import 'dart:typed_data';

import '../register.dart';
import '../ui.dart';




Register register = Register(() {
  
  

  MayaXmlWidget.register("Matrix4.fromBuffer", (node, key) {
    return Matrix4.fromBuffer(
        (node.s<ByteBuffer>("arg:0"))!, (node.s<int>("arg:1"))!);
  });
});

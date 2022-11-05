import 'package:vector_math/vector_math_64.dart';

import '../register.dart';
import '../ui.dart';




Register register = Register(() {
  
  

  MayaXmlWidget.register("Matrix4.fromList", (node, key) {
    return Matrix4.fromList(
        ((node.s<List<double>?>("arg:0") ?? node.child<List<double>>()))!);
  });
});

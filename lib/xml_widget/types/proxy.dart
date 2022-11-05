import '../ui.dart';
import 'function.dart' as function;
import '../register.dart';

Register register = Register(() {
  MayaXmlWidget.register("proxy", (node, key) {
    return node.s("target");
  });
});

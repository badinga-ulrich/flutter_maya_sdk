import '../register.dart';
import '../ui.dart';


Register register = Register(() {
  MayaXmlWidget.registerInline(Duration, "zero", true, (node, method) {
    return Duration.zero;
  });
});

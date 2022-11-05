import '../register.dart';
import '../ui.dart';




Register register = Register(() {
  
  

  MayaXmlWidget.register("Duration", (node, key) {
    return Duration(
        days: (node.s<int>("days", 0))!,
        hours: (node.s<int>("hours", 0))!,
        minutes: (node.s<int>("minutes", 0))!,
        seconds: (node.s<int>("seconds", 0))!,
        milliseconds: (node.s<int>("milliseconds", 0))!,
        microseconds: (node.s<int>("microseconds", 0))!);
  });
});

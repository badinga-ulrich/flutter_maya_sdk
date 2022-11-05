import 'package:flutter/widgets.dart';

import '../register.dart';
import '../ui.dart';

import '../enums/TextDirection.dart' as _EnumTextDirection;



Register register = Register(() {
  _EnumTextDirection.register();
  
  

  MayaXmlWidget.register("Icon", (node, key) {
    return Icon((node.s<IconData?>("arg:0") ?? node.child<IconData>()),
        key: key,
        size: node.s<double>("size"),
        color: node.s<Color>("color"),
        semanticLabel: node.s<String>("semanticLabel"),
        textDirection: node.s<TextDirection>("textDirection"));
  });
});

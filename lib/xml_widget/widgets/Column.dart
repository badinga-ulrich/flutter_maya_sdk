import 'package:flutter/widgets.dart';

import '../register.dart';
import '../ui.dart';

import '../enums/MainAxisAlignment.dart' as _EnumMainAxisAlignment;
import '../enums/MainAxisSize.dart' as _EnumMainAxisSize;
import '../enums/CrossAxisAlignment.dart' as _EnumCrossAxisAlignment;
import '../enums/VerticalDirection.dart' as _EnumVerticalDirection;
import '../enums/TextDirection.dart' as _EnumTextDirection;
import '../enums/TextBaseline.dart' as _EnumTextBaseline;



Register register = Register(() {
  _EnumMainAxisAlignment.register();
  _EnumMainAxisSize.register();
  _EnumCrossAxisAlignment.register();
  _EnumVerticalDirection.register();
  _EnumTextDirection.register();
  _EnumTextBaseline.register();
  
  

  MayaXmlWidget.register("Column", (node, key) {
    return Column(
        key: key,
        mainAxisAlignment: (node.s<MainAxisAlignment>(
            "mainAxisAlignment", MainAxisAlignment.start))!,
        mainAxisSize: (node.s<MainAxisSize>("mainAxisSize", MainAxisSize.max))!,
        crossAxisAlignment: (node.s<CrossAxisAlignment>(
            "crossAxisAlignment", CrossAxisAlignment.center))!,
        textDirection: node.s<TextDirection>("textDirection"),
        verticalDirection: (node.s<VerticalDirection>(
            "verticalDirection", VerticalDirection.down))!,
        textBaseline: node.s<TextBaseline>("textBaseline"),
        children: node.children<Widget>());
  });
});

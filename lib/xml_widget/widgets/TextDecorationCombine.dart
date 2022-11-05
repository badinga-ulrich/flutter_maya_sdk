import 'dart:ui';

import '../register.dart';
import '../ui.dart';


import '../inlines/TextDecoration.dart' as _InlineTextDecoration;


Register register = Register(() {
  
  _InlineTextDecoration.register();
  

  MayaXmlWidget.register("TextDecoration.combine", (node, key) {
    return TextDecoration.combine(((node.s<List<TextDecoration>?>("arg:0") ??
        node.child<List<TextDecoration>>()))!);
  });
});

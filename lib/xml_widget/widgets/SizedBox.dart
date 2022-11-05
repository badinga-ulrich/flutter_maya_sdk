import 'package:flutter/widgets.dart';

import '../register.dart';
import '../ui.dart';




Register register = Register(() {
  
  

  MayaXmlWidget.register("SizedBox", (node, key) {
    return node.s<Size>("size") !=null ? SizedBox.fromSize(
        key: key,
        size: node.s<Size>("size"),
        child: node.child<Widget>(),): 
      (
        node.s<double>("dimension") !=null ? SizedBox.square(
        key: key,
        dimension: node.s<double>("dimension"),
        child: node.child<Widget>()) :
        (
          node.s<double>("width") != null  || node.s<double>("height") != null ? SizedBox(
            key: key,
            width: node.s<double>("width"),
            height: node.s<double>("height"),
            child: node.child<Widget>()
          ) : (
            node.s<bool>("expanded") ?? node.s<bool>("expand") ?? false ?
            SizedBox.expand(
            key: key,
            child: node.child<Widget>()) : 
            SizedBox.shrink(
            key: key,
            child: node.child<Widget>())
          )
        )
      );
  });
});

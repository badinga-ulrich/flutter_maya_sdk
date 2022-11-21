part of flutter_maya_sdk;
enum MayaImageMode{
  thumbnail,
  bestFit,
  resize,
  fitToWidth,
  fitToHeight,
}

enum MayaImageFilter{
  blur,
  brighten,
  colorize,
  contrast,
  darken,
  desaturate,
  edgeDetect,
  emboss,
  flip,
  invert,
  opacity,
  pixelate,
  sepia,
  sharpen,
  sketch,
}

class _MayaResourceRawRes{
  final Map<String, dynamic> api;
  final String result;
  _MayaResourceRawRes(this.result, this.api);
}


Future<String> _templateEngine(String tmpl, Map<String, dynamic> data) {
  Context context = Context.create();
  context.variables.addAll(data);
  Template template = Template.parse(context, Source.fromString(tmpl));
  return template.render(context);
}


Future<dynamic> _decodeString(String json) async {
  dynamic res;
  try {
    res = jsonDecode(json);
  } catch (e) {
    // debugPrint("JSON DECODE  ==> $json");
    // debugPrint("JSON DECODE ERROR ==> $e");
  }
  return res;
}

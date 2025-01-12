import 'dart:typed_data';

import 'package:cosmos_epub/Helpers/cssjson.dart';
import 'package:epubx/epubx.dart';

extension EB on EpubBook {
  Map<String, Map<String, String>> get cssProperties {
    Map<String, Map<String, String>> map = {};
    Content?.Css?.entries.forEach((element) {
      if (element.value.Content != null) {
        final cssMap = cssToJson(element.value.Content!);
        map.addAll(cssMap);
      }
    });
    return map;
  }

  Map<String, String> getCssProperty(String selector) {
    return cssProperties[selector] ?? {};
  }

  List<EpubByteContentFile> get allImages {
    return Content?.Images?.entries.map((v) => v.value).toList() ?? [];
  }

  Uint8List getImage(String? fileName) {
    final imgIndex = allImages.firstWhere((element) => fileName!.contains(element.FileName!));
    return Uint8List.fromList(imgIndex.Content!);
  }
}

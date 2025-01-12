import 'package:cosmos_epub/Helpers/book.dart';
import 'package:cosmos_epub/Helpers/cssjson.dart';
import 'package:cosmos_epub/Helpers/widget.dart';
import 'package:epubx/epubx.dart' as epub;
// import 'package:epubx/epubx.dart';
import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;

Widget? customWidgetBuilder(
  epub.EpubBook book,
  dom.Element element,
  TextStyle textStyle,
) {
  if (['title', 'link', 'meta', "html"].contains(element.localName)) {
    return const SizedBox();
  }
  final selector = element.className;

  final css = book.getCssProperty(selector);
  // iLogger.d(css);

  final style = mapCssToTextStyle(css);

  if (element.localName == 'h1') {
    return Text(element.text, style: style.merge(const TextStyle(fontSize: 24))).center.margin(bottom: 0);
  }
  if (element.localName == 'h2') {
    return Text(element.text, style: style.merge(const TextStyle(fontSize: 20))).center.margin(bottom: 0);
  }
  if (element.localName == 'p') {
    return Text("\u00A0\u00A0\u00A0\u00A0${element.text}", style: style.merge(textStyle), textAlign: TextAlign.justify).margin(bottom: 0);
  }

  final hasImage = element.innerHtml.contains("<img");
  if (hasImage) {
    final List<Widget> widgets = [];

    for (var tag in element.children) {
      if (tag.localName == "img") {
        final src = tag.attributes["src"];

        widgets.add(Image.memory(
          book.getImage(src),
        ));
      } else {
        widgets.add(Text(tag.text, style: style.merge(textStyle)));
      }
    }
    return Column(children: widgets);
  }

  return Text(element.text, style: style.merge(textStyle));
}

String extractChapterText(epub.EpubChapter chapter) {
  StringBuffer buffer = StringBuffer();
  if (chapter.HtmlContent != null) {
    buffer.write(chapter.HtmlContent?.replaceAll(RegExp(r'<[^>]*>'), '')); // 移除 HTML 标签
  }
  if (chapter.SubChapters != null && chapter.SubChapters!.isNotEmpty) {
    for (var subChapter in chapter.SubChapters!) {
      buffer.write(extractChapterText(subChapter));
    }
  }
  return buffer.toString();
}

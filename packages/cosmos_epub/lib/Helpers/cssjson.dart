import 'package:flutter/material.dart';

Map<String, Map<String, String>> cssToJson(String cssContent) {
  final Map<String, Map<String, String>> jsonMap = {};

  // 正则表达式匹配 CSS 规则
  final cssRegExp = RegExp(r'([^{]+)\{([^}]+)\}', multiLine: true);
  final propertyRegExp = RegExp(r'([\w-]+)\s*:\s*([^;]+);?');

  for (final match in cssRegExp.allMatches(cssContent)) {
    // 获取选择器，并去掉前面的 "."
    var selector = match.group(1)?.trim() ?? '';
    if (selector.startsWith('.')) {
      selector = selector.substring(1);
    }

    final properties = match.group(2)?.trim() ?? '';
    final Map<String, String> styles = {};

    // 解析属性和值
    for (final propertyMatch in propertyRegExp.allMatches(properties)) {
      final propertyName = propertyMatch.group(1)?.trim() ?? '';
      final propertyValue = propertyMatch.group(2)?.trim() ?? '';
      styles[propertyName] = propertyValue;
    }

    jsonMap[selector] = styles;
  }

  return jsonMap;
}

TextStyle cssToTextStyle(String cssContent, String selector) {
  // 解析选择器的样式块
  final cssRegExp = RegExp(r'([^{]+)\{([^}]+)\}', multiLine: true);
  final propertyRegExp = RegExp(r'([\w-]+)\s*:\s*([^;]+);?');

  // 查找匹配的选择器
  final match = cssRegExp.firstMatch(cssContent);
  if (match == null || !match.group(1)!.trim().contains(selector)) {
    return const TextStyle(); // 默认空样式
  }

  // 解析属性
  final properties = match.group(2)?.trim() ?? '';
  final Map<String, String> styles = {};
  for (final propertyMatch in propertyRegExp.allMatches(properties)) {
    final propertyName = propertyMatch.group(1)?.trim() ?? '';
    final propertyValue = propertyMatch.group(2)?.trim() ?? '';
    styles[propertyName] = propertyValue;
  }

  // 将 CSS 样式映射为 TextStyle
  return mapCssToTextStyle(styles);
}

TextStyle mapCssToTextStyle(Map<String, String> styles) {
  double? fontSize;
  Color? color;
  FontWeight? fontWeight;
  FontStyle? fontStyle;
  TextDecoration? textDecoration;

  styles.forEach((property, value) {
    switch (property) {
      case 'font-size':
        fontSize = double.tryParse(value.replaceAll('px', ''));
        break;
      case 'color':
        color = _parseColor(value);
        break;
      case 'font-weight':
        fontWeight = _parseFontWeight(value);
        break;
      case 'font-style':
        fontStyle = (value == 'italic') ? FontStyle.italic : FontStyle.normal;
        break;
      case 'text-decoration':
        if (value == 'underline') {
          textDecoration = TextDecoration.underline;
        } else if (value == 'line-through') {
          textDecoration = TextDecoration.lineThrough;
        } else if (value == 'none') {
          textDecoration = TextDecoration.none;
        }
        break;
    }
  });

  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    decoration: textDecoration,
  );
}

Color _parseColor(String value) {
  if (value.startsWith('#')) {
    final hex = value.replaceAll('#', '');
    if (hex.length == 6) {
      return Color(int.parse('0xff$hex'));
    } else if (hex.length == 3) {
      // 将短格式颜色扩展为完整格式
      final r = hex[0] * 2;
      final g = hex[1] * 2;
      final b = hex[2] * 2;
      return Color(int.parse('0xff$r$g$b'));
    }
  }
  return const Color(0xff000000); // 默认黑色
}

FontWeight _parseFontWeight(String value) {
  switch (value) {
    case 'bold':
      return FontWeight.bold;
    case 'normal':
      return FontWeight.normal;
    case '100':
      return FontWeight.w100;
    case '200':
      return FontWeight.w200;
    case '300':
      return FontWeight.w300;
    case '400':
      return FontWeight.w400;
    case '500':
      return FontWeight.w500;
    case '600':
      return FontWeight.w600;
    case '700':
      return FontWeight.w700;
    case '800':
      return FontWeight.w800;
    case '900':
      return FontWeight.w900;
    default:
      return FontWeight.normal;
  }
}

Widget cssToWidget(String cssContent, Map<String, dynamic> elements) {
  final cssRegExp = RegExp(r'([^{]+)\{([^}]+)\}', multiLine: true);
  final propertyRegExp = RegExp(r'([\w-]+)\s*:\s*([^;]+);?');
  final Map<String, Map<String, String>> stylesMap = {};

  for (final match in cssRegExp.allMatches(cssContent)) {
    final selector = match.group(1)?.trim() ?? '';
    final properties = match.group(2)?.trim() ?? '';
    final Map<String, String> styles = {};
    for (final propertyMatch in propertyRegExp.allMatches(properties)) {
      final propertyName = propertyMatch.group(1)?.trim() ?? '';
      final propertyValue = propertyMatch.group(2)?.trim() ?? '';
      styles[propertyName] = propertyValue;
    }
    stylesMap[selector] = styles;
  }

  // 遍历元素，生成组件
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: elements.entries.map((entry) {
      final tag = entry.key;
      final content = entry.value;

      if (tag == 'p' && content is List<String>) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: content.map((text) => buildParagraph(text, stylesMap[tag] ?? {})).toList(),
        );
      } else if (tag == 'ul' && content is List<List<String>>) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: content.map((items) => buildList(items, 'disc', stylesMap[tag]?['margin-left'] ?? '0')).toList(),
        );
      } else if (tag == 'ol' && content is List<List<String>>) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: content.map((items) => buildList(items, 'decimal', stylesMap[tag]?['margin-left'] ?? '0')).toList(),
        );
      } else if (tag == 'img' && content is List<String>) {
        return Column(
          children: content.map((url) => buildImage(url, stylesMap[tag] ?? {})).toList(),
        );
      }

      return const SizedBox.shrink();
    }).toList(),
  );
}

Widget buildParagraph(String text, Map<String, String> styles) {
  final textAlign = styles['text-align'] == 'justify'
      ? TextAlign.justify
      : styles['text-align'] == 'center'
          ? TextAlign.center
          : styles['text-align'] == 'right'
              ? TextAlign.right
              : TextAlign.left;

  final textStyle = TextStyle(
    fontSize: double.tryParse(styles['font-size']?.replaceAll('px', '') ?? '16'),
    height: double.tryParse(styles['line-height'] ?? '1.0'),
    color: _parseColor(styles['color'] ?? '#000000'),
  );

  final textIndent = double.tryParse(styles['text-indent']?.replaceAll('em', '') ?? '0')! * 16.0;

  final margin = _parseEdgeInsets(styles['margin'] ?? '0');

  return Container(
    margin: margin,
    child: Text(
      text,
      textAlign: textAlign,
      style: textStyle.copyWith(
        // 自定义首行缩进
        height: textStyle.height,
        letterSpacing: textIndent > 0 ? textIndent : null,
      ),
    ),
  );
}

Widget buildList(List<String> items, String listType, String marginLeft) {
  final isOrdered = listType == 'decimal';
  final margin = double.tryParse(marginLeft.replaceAll('px', ''));

  return Padding(
    padding: EdgeInsets.only(left: margin ?? 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.asMap().entries.map((entry) {
        final index = entry.key + 1;
        final item = entry.value;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isOrdered) Text('$index. ') else const Text('• '),
            Expanded(child: Text(item)),
          ],
        );
      }).toList(),
    ),
  );
}

Widget buildImage(String url, Map<String, String> styles) {
  final width = double.tryParse(styles['width']?.replaceAll('px', '') ?? '300');
  final height = styles['height'] == 'auto' ? null : double.tryParse(styles['height']?.replaceAll('px', '') ?? 'auto');
  final margin = _parseEdgeInsets(styles['margin'] ?? '0');

  return Container(
    margin: margin,
    child: Image.network(
      url,
      width: width,
      height: height,
      fit: BoxFit.cover,
    ),
  );
}

EdgeInsets _parseEdgeInsets(String value) {
  final parts = value.split(RegExp(r'\s+')).map((e) => e.replaceAll('px', '')).toList();
  if (parts.length == 1) {
    final all = double.tryParse(parts[0]) ?? 0.0;
    return EdgeInsets.all(all);
  } else if (parts.length == 2) {
    final vertical = double.tryParse(parts[0]) ?? 0.0;
    final horizontal = double.tryParse(parts[1]) ?? 0.0;
    return EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal);
  } else if (parts.length == 4) {
    final top = double.tryParse(parts[0]) ?? 0.0;
    final right = double.tryParse(parts[1]) ?? 0.0;
    final bottom = double.tryParse(parts[2]) ?? 0.0;
    final left = double.tryParse(parts[3]) ?? 0.0;
    return EdgeInsets.fromLTRB(left, top, right, bottom);
  }
  return EdgeInsets.zero;
}

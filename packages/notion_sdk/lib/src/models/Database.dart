import 'package:json_annotation/json_annotation.dart';
import 'package:notion_sdk/src/models/Properties.dart';
import 'package:notion_sdk/src/models/RichText.dart';
part 'Database.g.dart';

class Database {
  String object = 'database';
  late String id;
  late DateTime createdTime;
  late DateTime lastEditedTime;
  late RichTexts title;
  late Properties properties;
  IconCover? cover;
  IconCover? icon;

  //     required this.cover,
//     required this.icon,

  Database({
    required this.object,
    required this.id,
    required this.createdTime,
    required this.lastEditedTime,
    required this.title,
    required this.properties,
    this.cover,
    this.icon,
  });

  Database.fromJson(Map<String, dynamic> json, {bool isQuery = false}) {
    object = json['object'];
    id = json['id'];
    createdTime = DateTime.parse(json['created_time']);
    lastEditedTime = DateTime.parse(json['last_edited_time']);
    title = RichTexts.fromTextList(json['title']);
    properties = Properties.fromJson(json['properties'], isDatabase: true, isQuery: isQuery);
    if (json['icon'] != null) icon = IconCover.fromJson(json['icon']);
    if (json['cover'] != null) cover = IconCover.fromJson(json['cover']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['object'] = object;
    data['id'] = id;
    data['created_time'] = createdTime;
    data['last_edited_time'] = lastEditedTime;
    data['title'] = title.toJson();
    data['properties'] = properties.toJson();

    return data;
  }
}
// database.dart

// @JsonSerializable(explicitToJson: true)
// class Database {
//   final String object;
//   final String id;
//   final Cover cover;
//   final Icon icon;
//   final String createdTime;
//   final _User createdBy;
//   final _User lastEditedBy;
//   final String lastEditedTime;
//   final List<_Title> title;
//   final List<dynamic> description;
//   final bool isInline;
//   final Properties properties;
//   final _Parent parent;
//   final String url;
//   final dynamic publicUrl;
//   final bool archived;
//   final bool inTrash;
//   final String requestId;

//   Database({
//     required this.object,
//     required this.id,
//     required this.cover,
//     required this.icon,
//     required this.createdTime,
//     required this.createdBy,
//     required this.lastEditedBy,
//     required this.lastEditedTime,
//     required this.title,
//     required this.description,
//     required this.isInline,
//     required this.properties,
//     required this.parent,
//     required this.url,
//     this.publicUrl,
//     required this.archived,
//     required this.inTrash,
//     required this.requestId,
//   });

//   factory Database.fromJson(Map<String, dynamic> json) => _$DatabaseFromJson(json);
//   Map<String, dynamic> toJson() => _$DatabaseToJson(this);
// }

@JsonSerializable()
class IconCover {
  final String type;
  final XFile? file;
  String? emoji;
  String? external;

  IconCover({required this.type, this.file, this.emoji, this.external});

  factory IconCover.fromJson(Map<String, dynamic> json) {
    if (json['type'] == 'external') {
      return IconCover(type: json['type'], external: json['external']['url']);
    }
    if (json['type'] == 'emoji') {
      return IconCover(type: json['type'], emoji: json['emoji']);
    }
    return _$IconCoverFromJson(json);
  }

  Map<String, dynamic> toJson() => _$IconCoverToJson(this);
}

@JsonSerializable()
class XFile {
  final String url;
  final String expiry_time;

  XFile({required this.url, required this.expiry_time});

  factory XFile.fromJson(Map<String, dynamic> json) => _$XFileFromJson(json);
  Map<String, dynamic> toJson() => _$XFileToJson(this);
}

// @JsonSerializable()
// class _User {
//   final String object;
//   final String id;

//   _User({required this.object, required this.id});

//   factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
//   Map<String, dynamic> toJson() => _$UserToJson(this);
// }

// @JsonSerializable()
// class _Title {
//   final String type;
//   final _Text text;
//   final _Annotations annotations;
//   final String plainText;
//   final dynamic href;

//   _Title({
//     required this.type,
//     required this.text,
//     required this.annotations,
//     required this.plainText,
//     this.href,
//   });

//   factory _Title.fromJson(Map<String, dynamic> json) => _$TitleFromJson(json);
//   Map<String, dynamic> toJson() => _$TitleToJson(this);
// }

// @JsonSerializable()
// class _Text {
//   final String content;
//   final dynamic link;

//   _Text({required this.content, this.link});

//   factory _Text.fromJson(Map<String, dynamic> json) => _$TextFromJson(json);
//   Map<String, dynamic> toJson() => _$TextToJson(this);
// }

// @JsonSerializable()
// class _Annotations {
//   final bool bold;
//   final bool italic;
//   final bool strikethrough;
//   final bool underline;
//   final bool code;
//   final String color;

//   _Annotations({
//     required this.bold,
//     required this.italic,
//     required this.strikethrough,
//     required this.underline,
//     required this.code,
//     required this.color,
//   });

//   factory _Annotations.fromJson(Map<String, dynamic> json) => _$AnnotationsFromJson(json);
//   Map<String, dynamic> toJson() => _$AnnotationsToJson(this);
// }

// @JsonSerializable()
// class _Select {
//   final List<_Option> options;

//   _Select({required this.options});

//   factory _Select.fromJson(Map<String, dynamic> json) => _$SelectFromJson(json);
//   Map<String, dynamic> toJson() => _$SelectToJson(this);
// }

// @JsonSerializable()
// class _Option {
//   final String id;
//   final String name;
//   final String color;
//   final dynamic description;

//   _Option({
//     required this.id,
//     required this.name,
//     required this.color,
//     this.description,
//   });

//   factory _Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
//   Map<String, dynamic> toJson() => _$OptionToJson(this);
// }

// @JsonSerializable()
// class _Url {
//   _Url();

//   factory _Url.fromJson(Map<String, dynamic> json) => _$UrlFromJson(json);
//   Map<String, dynamic> toJson() => _$UrlToJson(this);
// }

// @JsonSerializable()
// class _MultiSelect {
//   final List<_Option> options;

//   _MultiSelect({required this.options});

//   factory _MultiSelect.fromJson(Map<String, dynamic> json) => _$MultiSelectFromJson(json);
//   Map<String, dynamic> toJson() => _$MultiSelectToJson(this);
// }

// @JsonSerializable()
// class _CreatedTime {
//   _CreatedTime();

//   factory _CreatedTime.fromJson(Map<String, dynamic> json) => _$CreatedTimeFromJson(json);
//   Map<String, dynamic> toJson() => _$CreatedTimeToJson(this);
// }

// @JsonSerializable()
// class _Parent {
//   final String type;
//   final String pageId;

//   _Parent({required this.type, required this.pageId});

//   factory _Parent.fromJson(Map<String, dynamic> json) => _$ParentFromJson(json);
//   Map<String, dynamic> toJson() => _$ParentToJson(this);
// }

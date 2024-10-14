// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Database.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IconCover _$IconCoverFromJson(Map<String, dynamic> json) => IconCover(
      type: json['type'] as String,
      file: XFile.fromJson(json['file'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IconCoverToJson(IconCover instance) => <String, dynamic>{
      'type': instance.type,
      'file': instance.file,
    };

XFile _$XFileFromJson(Map<String, dynamic> json) => XFile(
      url: json['url'] as String,
      expiry_time: json['expiry_time'] as String,
    );

Map<String, dynamic> _$XFileToJson(XFile instance) => <String, dynamic>{
      'url': instance.url,
      'expiry_time': instance.expiry_time,
    };

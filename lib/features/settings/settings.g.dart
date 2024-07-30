// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TopicsImpl _$$TopicsImplFromJson(Map<String, dynamic> json) => _$TopicsImpl(
      cache: (json['cache'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, Topic.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
    );

Map<String, dynamic> _$$TopicsImplToJson(_$TopicsImpl instance) =>
    <String, dynamic>{
      'cache': instance.cache,
    };

_$TopicImpl _$$TopicImplFromJson(Map<String, dynamic> json) => _$TopicImpl(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      content: json['content'] as String? ?? '',
    );

Map<String, dynamic> _$$TopicImplToJson(_$TopicImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
    };

_$SettingsImpl _$$SettingsImplFromJson(Map<String, dynamic> json) =>
    _$SettingsImpl(
      themeMode: $enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']) ??
          ThemeMode.system,
      materialColor: json['materialColor'] == null
          ? Colors.blue
          : const MaterialColorConvertor()
              .fromJson((json['materialColor'] as num).toInt()),
      padding: (json['padding'] as num?)?.toDouble() ?? 8.0,
      borderRadius: (json['borderRadius'] as num?)?.toDouble() ?? 8.0,
    );

Map<String, dynamic> _$$SettingsImplToJson(_$SettingsImpl instance) =>
    <String, dynamic>{
      'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
      'materialColor':
          const MaterialColorConvertor().toJson(instance.materialColor),
      'padding': instance.padding,
      'borderRadius': instance.borderRadius,
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};

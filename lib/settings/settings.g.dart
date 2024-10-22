// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettingsImpl _$$SettingsImplFromJson(Map<String, dynamic> json) =>
    _$SettingsImpl(
      themeMode: $enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']) ??
          ThemeMode.system,
      materialColor: json['materialColor'] == null
          ? Colors.blue
          : const MaterialColorConverter()
              .fromJson((json['materialColor'] as num).toInt()),
      padding: (json['padding'] as num?)?.toDouble() ?? 8.0,
      borderRadius: (json['borderRadius'] as num?)?.toDouble() ?? 8.0,
      editMode: json['editMode'] as bool? ?? false,
    );

Map<String, dynamic> _$$SettingsImplToJson(_$SettingsImpl instance) =>
    <String, dynamic>{
      'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
      'materialColor':
          const MaterialColorConverter().toJson(instance.materialColor),
      'padding': instance.padding,
      'borderRadius': instance.borderRadius,
      'editMode': instance.editMode,
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};

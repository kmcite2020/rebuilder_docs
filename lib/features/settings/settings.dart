// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rebuilder_docs/main.dart';
part 'settings.freezed.dart';
part 'settings.g.dart';

@freezed
class Topics with _$Topics {
  const factory Topics({
    @Default({}) final Map<String, Topic> cache,
  }) = _Topics;

  factory Topics.fromJson(Map<String, dynamic> json) => _$TopicsFromJson(json);
}

@freezed
class Topic with _$Topic {
  const factory Topic({
    @Default('') final String id,
    @Default('') final String title,
    @Default('') final String content,
  }) = _Topic;

  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);
}

@freezed
class Settings with _$Settings {
  const factory Settings({
    @Default(ThemeMode.system) final ThemeMode themeMode,
    @MaterialColorConvertor() @Default(Colors.blue) final MaterialColor materialColor,
    @Default(8.0) final double padding,
    @Default(8.0) final double borderRadius,
  }) = _Settings;

  factory Settings.fromJson(Map<String, dynamic> json) => _$SettingsFromJson(json);
}

class MaterialColorConvertor extends JsonConverter<MaterialColor, int> {
  const MaterialColorConvertor();

  @override
  MaterialColor fromJson(int json) => Colors.primaries[json];

  @override
  int toJson(MaterialColor object) => Colors.primaries.indexOf(object);
}

final settingsRM = RM.inject(
  () => Settings(),
  persist: () => PersistState(
    key: 'settings',
    toJson: (s) => jsonEncode(s.toJson()),
    fromJson: (json) => Settings.fromJson(jsonDecode(json)),
  ),
);

Settings settings([Settings? _settings]) {
  if (_settings != null) {
    settingsRM.state = _settings;
  }
  return settingsRM.state;
}

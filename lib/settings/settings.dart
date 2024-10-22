import 'package:rebuilder_docs/main.dart';
part 'settings.freezed.dart';
part 'settings.g.dart';

// @freezed
// class Topics with _$Topics {
//   const factory Topics({
//     @Default({}) final Map<String, Topic> cache,
//   }) = _Topics;

//   factory Topics.fromJson(Map<String, dynamic> json) => _$TopicsFromJson(json);
// }

// @freezed
// class Topic with _$Topic {
//   const factory Topic({
//     @Default('') final String id,
//     @Default('') final String title,
//     @Default('') final String content,
//   }) = _Topic;

//   factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);
// }

@freezed
class Settings with _$Settings {
  const factory Settings({
    @Default(ThemeMode.system) final ThemeMode themeMode,
    @MaterialColorConverter() @Default(Colors.blue) final MaterialColor materialColor,
    @Default(8.0) final double padding,
    @Default(8.0) final double borderRadius,
    @Default(false) final bool editMode,
  }) = _Settings;

  factory Settings.fromJson(Map<String, dynamic> json) => _$SettingsFromJson(json);
}

final settingsRM = RM.inject(
  () => Settings(),
  persist: () => persisted(
    'settings',
    Settings.fromJson,
  ),
);

Settings settings([Settings? _settings]) {
  if (_settings != null) {
    settingsRM.state = _settings;
  }
  return settingsRM.state;
}

bool editMode([bool? _editMode]) {
  if (_editMode != null) {
    settings(settings().copyWith(editMode: _editMode));
  }
  return settings().editMode;
}

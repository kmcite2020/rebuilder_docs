import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rebuilder_docs/main.dart';

part 'backup.freezed.dart';
part 'backup.g.dart';

final backupRM = RM.inject(() => Backup(id: '', isBackingUp: '', settings: '', topics: ''));

@freezed
class Backup with _$Backup {
  const factory Backup({
    @Default('') final String id,
    @Default('') final String isBackingUp,
    @Default('') final String settings,
    @Default('') final String topics,
  }) = _Backup;

  factory Backup.fromJson(Map<String, dynamic> json) => _$BackupFromJson(json);
}

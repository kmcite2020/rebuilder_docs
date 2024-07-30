// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'backup.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Backup _$BackupFromJson(Map<String, dynamic> json) {
  return _Backup.fromJson(json);
}

/// @nodoc
mixin _$Backup {
  String get id => throw _privateConstructorUsedError;
  String get isBackingUp => throw _privateConstructorUsedError;
  String get settings => throw _privateConstructorUsedError;
  String get topics => throw _privateConstructorUsedError;

  /// Serializes this Backup to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Backup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BackupCopyWith<Backup> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BackupCopyWith<$Res> {
  factory $BackupCopyWith(Backup value, $Res Function(Backup) then) =
      _$BackupCopyWithImpl<$Res, Backup>;
  @useResult
  $Res call({String id, String isBackingUp, String settings, String topics});
}

/// @nodoc
class _$BackupCopyWithImpl<$Res, $Val extends Backup>
    implements $BackupCopyWith<$Res> {
  _$BackupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Backup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isBackingUp = null,
    Object? settings = null,
    Object? topics = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isBackingUp: null == isBackingUp
          ? _value.isBackingUp
          : isBackingUp // ignore: cast_nullable_to_non_nullable
              as String,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as String,
      topics: null == topics
          ? _value.topics
          : topics // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BackupImplCopyWith<$Res> implements $BackupCopyWith<$Res> {
  factory _$$BackupImplCopyWith(
          _$BackupImpl value, $Res Function(_$BackupImpl) then) =
      __$$BackupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String isBackingUp, String settings, String topics});
}

/// @nodoc
class __$$BackupImplCopyWithImpl<$Res>
    extends _$BackupCopyWithImpl<$Res, _$BackupImpl>
    implements _$$BackupImplCopyWith<$Res> {
  __$$BackupImplCopyWithImpl(
      _$BackupImpl _value, $Res Function(_$BackupImpl) _then)
      : super(_value, _then);

  /// Create a copy of Backup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isBackingUp = null,
    Object? settings = null,
    Object? topics = null,
  }) {
    return _then(_$BackupImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isBackingUp: null == isBackingUp
          ? _value.isBackingUp
          : isBackingUp // ignore: cast_nullable_to_non_nullable
              as String,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as String,
      topics: null == topics
          ? _value.topics
          : topics // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BackupImpl implements _Backup {
  const _$BackupImpl(
      {this.id = '',
      this.isBackingUp = '',
      this.settings = '',
      this.topics = ''});

  factory _$BackupImpl.fromJson(Map<String, dynamic> json) =>
      _$$BackupImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String isBackingUp;
  @override
  @JsonKey()
  final String settings;
  @override
  @JsonKey()
  final String topics;

  @override
  String toString() {
    return 'Backup(id: $id, isBackingUp: $isBackingUp, settings: $settings, topics: $topics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BackupImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isBackingUp, isBackingUp) ||
                other.isBackingUp == isBackingUp) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.topics, topics) || other.topics == topics));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, isBackingUp, settings, topics);

  /// Create a copy of Backup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BackupImplCopyWith<_$BackupImpl> get copyWith =>
      __$$BackupImplCopyWithImpl<_$BackupImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BackupImplToJson(
      this,
    );
  }
}

abstract class _Backup implements Backup {
  const factory _Backup(
      {final String id,
      final String isBackingUp,
      final String settings,
      final String topics}) = _$BackupImpl;

  factory _Backup.fromJson(Map<String, dynamic> json) = _$BackupImpl.fromJson;

  @override
  String get id;
  @override
  String get isBackingUp;
  @override
  String get settings;
  @override
  String get topics;

  /// Create a copy of Backup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BackupImplCopyWith<_$BackupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

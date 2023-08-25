// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_entity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TaskEntityCWProxy {
  TaskEntity id(int? id);

  TaskEntity title(String? title);

  TaskEntity description(String? description);

  TaskEntity dueDate(String? dueDate);

  TaskEntity status(bool? status);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TaskEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TaskEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  TaskEntity call({
    int? id,
    String? title,
    String? description,
    String? dueDate,
    bool? status,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTaskEntity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTaskEntity.copyWith.fieldName(...)`
class _$TaskEntityCWProxyImpl implements _$TaskEntityCWProxy {
  const _$TaskEntityCWProxyImpl(this._value);

  final TaskEntity _value;

  @override
  TaskEntity id(int? id) => this(id: id);

  @override
  TaskEntity title(String? title) => this(title: title);

  @override
  TaskEntity description(String? description) => this(description: description);

  @override
  TaskEntity dueDate(String? dueDate) => this(dueDate: dueDate);

  @override
  TaskEntity status(bool? status) => this(status: status);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TaskEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TaskEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  TaskEntity call({
    Object? id = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? dueDate = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
  }) {
    return TaskEntity(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String?,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      dueDate: dueDate == const $CopyWithPlaceholder()
          ? _value.dueDate
          // ignore: cast_nullable_to_non_nullable
          : dueDate as String?,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as bool?,
    );
  }
}

extension $TaskEntityCopyWith on TaskEntity {
  /// Returns a callable class that can be used as follows: `instanceOfTaskEntity.copyWith(...)` or like so:`instanceOfTaskEntity.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TaskEntityCWProxy get copyWith => _$TaskEntityCWProxyImpl(this);
}

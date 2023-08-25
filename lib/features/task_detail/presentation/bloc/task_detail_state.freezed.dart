// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TaskDetailState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  bool get isFinished => throw _privateConstructorUsedError;
  TaskEntity? get taskEntity => throw _privateConstructorUsedError;
  String? get errorText => throw _privateConstructorUsedError;
  String? get successText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskDetailStateCopyWith<TaskDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskDetailStateCopyWith<$Res> {
  factory $TaskDetailStateCopyWith(
          TaskDetailState value, $Res Function(TaskDetailState) then) =
      _$TaskDetailStateCopyWithImpl<$Res, TaskDetailState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool hasError,
      bool isFinished,
      TaskEntity? taskEntity,
      String? errorText,
      String? successText});
}

/// @nodoc
class _$TaskDetailStateCopyWithImpl<$Res, $Val extends TaskDetailState>
    implements $TaskDetailStateCopyWith<$Res> {
  _$TaskDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? isFinished = null,
    Object? taskEntity = freezed,
    Object? errorText = freezed,
    Object? successText = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      isFinished: null == isFinished
          ? _value.isFinished
          : isFinished // ignore: cast_nullable_to_non_nullable
              as bool,
      taskEntity: freezed == taskEntity
          ? _value.taskEntity
          : taskEntity // ignore: cast_nullable_to_non_nullable
              as TaskEntity?,
      errorText: freezed == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
      successText: freezed == successText
          ? _value.successText
          : successText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TaskDetailStateCopyWith<$Res>
    implements $TaskDetailStateCopyWith<$Res> {
  factory _$$_TaskDetailStateCopyWith(
          _$_TaskDetailState value, $Res Function(_$_TaskDetailState) then) =
      __$$_TaskDetailStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool hasError,
      bool isFinished,
      TaskEntity? taskEntity,
      String? errorText,
      String? successText});
}

/// @nodoc
class __$$_TaskDetailStateCopyWithImpl<$Res>
    extends _$TaskDetailStateCopyWithImpl<$Res, _$_TaskDetailState>
    implements _$$_TaskDetailStateCopyWith<$Res> {
  __$$_TaskDetailStateCopyWithImpl(
      _$_TaskDetailState _value, $Res Function(_$_TaskDetailState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hasError = null,
    Object? isFinished = null,
    Object? taskEntity = freezed,
    Object? errorText = freezed,
    Object? successText = freezed,
  }) {
    return _then(_$_TaskDetailState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      isFinished: null == isFinished
          ? _value.isFinished
          : isFinished // ignore: cast_nullable_to_non_nullable
              as bool,
      taskEntity: freezed == taskEntity
          ? _value.taskEntity
          : taskEntity // ignore: cast_nullable_to_non_nullable
              as TaskEntity?,
      errorText: freezed == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
      successText: freezed == successText
          ? _value.successText
          : successText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_TaskDetailState implements _TaskDetailState {
  _$_TaskDetailState(
      {this.isLoading = false,
      this.hasError = false,
      this.isFinished = false,
      this.taskEntity,
      this.errorText,
      this.successText});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool hasError;
  @override
  @JsonKey()
  final bool isFinished;
  @override
  final TaskEntity? taskEntity;
  @override
  final String? errorText;
  @override
  final String? successText;

  @override
  String toString() {
    return 'TaskDetailState(isLoading: $isLoading, hasError: $hasError, isFinished: $isFinished, taskEntity: $taskEntity, errorText: $errorText, successText: $successText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskDetailState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.isFinished, isFinished) ||
                other.isFinished == isFinished) &&
            (identical(other.taskEntity, taskEntity) ||
                other.taskEntity == taskEntity) &&
            (identical(other.errorText, errorText) ||
                other.errorText == errorText) &&
            (identical(other.successText, successText) ||
                other.successText == successText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, hasError, isFinished,
      taskEntity, errorText, successText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskDetailStateCopyWith<_$_TaskDetailState> get copyWith =>
      __$$_TaskDetailStateCopyWithImpl<_$_TaskDetailState>(this, _$identity);
}

abstract class _TaskDetailState implements TaskDetailState {
  factory _TaskDetailState(
      {final bool isLoading,
      final bool hasError,
      final bool isFinished,
      final TaskEntity? taskEntity,
      final String? errorText,
      final String? successText}) = _$_TaskDetailState;

  @override
  bool get isLoading;
  @override
  bool get hasError;
  @override
  bool get isFinished;
  @override
  TaskEntity? get taskEntity;
  @override
  String? get errorText;
  @override
  String? get successText;
  @override
  @JsonKey(ignore: true)
  _$$_TaskDetailStateCopyWith<_$_TaskDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

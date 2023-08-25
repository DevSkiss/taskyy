import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_task_manager/features/home/domain/entities/task_entity.dart';

part 'task_detail_state.freezed.dart';

@freezed
class TaskDetailState with _$TaskDetailState {
  factory TaskDetailState({
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
    @Default(false) bool isFinished,
    TaskEntity? taskEntity,
    String? errorText,
    String? successText,
  }) = _TaskDetailState;
}

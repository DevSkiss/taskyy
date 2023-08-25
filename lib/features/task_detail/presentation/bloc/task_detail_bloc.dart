import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_task_manager/core/isar/collections/task.dart';
import 'package:my_task_manager/features/home/domain/entities/task_entity.dart';
import 'package:my_task_manager/features/task_detail/domain/usecases/create_task.dart';
import 'package:my_task_manager/features/task_detail/domain/usecases/delete_task.dart';
import 'package:my_task_manager/features/task_detail/domain/usecases/update_task.dart';
import 'package:my_task_manager/features/task_detail/presentation/bloc/task_detail_state.dart';

class TaskDetailBloc extends Cubit<TaskDetailState> {
  TaskDetailBloc({required TaskEntity? task}) : super(TaskDetailState()) {
    initialized(task: task);
  }

  void initialized({TaskEntity? task}) {
    emit(state.copyWith(
      taskEntity: task ??
          const TaskEntity(
            id: 0,
            title: '',
            description: '',
            dueDate: '',
            status: false,
          ),
    ));
  }

  bool validateFields() {
    if ((state.taskEntity?.title?.isEmpty ?? false) ||
        (state.taskEntity?.description?.isEmpty ?? false) ||
        (state.taskEntity?.dueDate?.isEmpty ?? false)) {
      return false;
    }

    return true;
  }

  void onChangedTitle(String val) {
    emit(state.copyWith(taskEntity: state.taskEntity?.copyWith(title: val)));
  }

  void onChangedDescription(String val) {
    emit(
      state.copyWith(
        taskEntity: state.taskEntity?.copyWith(
          description: val,
        ),
      ),
    );
  }

  void onChangedDueDate(String val) {
    String formattedDate = DateFormat('MM-dd-yyyy').format(DateTime.parse(val));

    emit(state.copyWith(
      taskEntity: state.taskEntity?.copyWith(
        dueDate: formattedDate,
      ),
    ));
  }

  void onChangedStatus(bool? val) {
    emit(
      state.copyWith(
        taskEntity: state.taskEntity?.copyWith(status: val),
      ),
    );
  }

  Future<void> createTask(TaskEntity task) async {
    await CreateTaskUseCase().createTask(
      Task()
        ..title = task.title
        ..description = task.title
        ..dueDate = task.dueDate
        ..status = task.status,
    );
  }

  Future<void> deleteTask(TaskEntity task) async {
    await DeleteTaskUseCase().deleteTask(
      Task()
        ..id = task.id ?? 0
        ..title = task.title
        ..description = task.title
        ..dueDate = task.dueDate
        ..status = task.status,
    );
  }

  Future<void> updateTask(TaskEntity task) async {
    await UpdateTaskUseCase().updateTask(
      Task()
        ..id = task.id ?? 0
        ..title = task.title
        ..description = task.description
        ..dueDate = task.dueDate
        ..status = task.status,
    );
  }
}

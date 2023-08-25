import 'package:my_task_manager/core/dependency_injection.dart';
import 'package:my_task_manager/core/isar/collections/task.dart';
import 'package:my_task_manager/features/home/domain/repositories/task_repository.dart';

class GetLocalInCompleteTasks {
  Stream<List<Task>> getTasksLocally() async* {
    yield* locator<TaskRepository>().getIncompleteTask();
  }
}

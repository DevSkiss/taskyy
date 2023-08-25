import 'package:my_task_manager/core/dependency_injection.dart';
import 'package:my_task_manager/core/isar/collections/task.dart';
import 'package:my_task_manager/features/home/domain/repositories/task_repository.dart';

class UpdateTaskUseCase {
  Future<void> updateTask(Task task) async {
    return await locator<TaskRepository>().updateTask(task);
  }
}

import 'package:my_task_manager/core/isar/collections/task.dart';

abstract class TaskRepository {
  Future<List<Task>>? getAllTasks();
  Stream<List<Task>> getIncompleteTask();
  Stream<List<Task>> getCompletedTasks();
  Future<void> addTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> deleteTask(Task task);
}

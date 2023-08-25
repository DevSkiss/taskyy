import 'package:my_task_manager/core/dependency_injection.dart';
import 'package:my_task_manager/core/isar/collections/task.dart';
import 'package:my_task_manager/features/home/data/data_source/local/task_data_source.dart';
import 'package:my_task_manager/features/home/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSource _localDataSource = locator<TaskLocalDataSource>();
  @override
  Future<void> addTask(Task task) async => await _localDataSource.addTask(task);

  @override
  Future<void> deleteTask(Task task) async =>
      await _localDataSource.deleteTask(task);
  @override
  Future<List<Task>>? getAllTasks() => _localDataSource.getAllTasks();

  @override
  Stream<List<Task>> getCompletedTasks() async* {
    yield* _localDataSource.getCompletedTasks();
  }

  @override
  Stream<List<Task>> getIncompleteTask() async* {
    yield* _localDataSource.getIncompleteTask();
  }

  @override
  Future<void> updateTask(Task task) async =>
      await _localDataSource.updateTask(task);
}

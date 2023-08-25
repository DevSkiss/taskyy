import 'package:isar/isar.dart';
import 'package:my_task_manager/core/isar/collections/task.dart';

abstract class TaskLocalDataSource {
  Future<List<Task>>? getAllTasks();
  Stream<List<Task>> getIncompleteTask();
  Stream<List<Task>> getCompletedTasks();
  Future<void> addTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> deleteTask(Task task);
}

class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  final Isar? isar = Isar.getInstance();

  @override
  Future<List<Task>>? getAllTasks() {
    return isar?.tasks.where().findAll();
  }

  @override
  Stream<List<Task>> getIncompleteTask() async* {
    if (isar?.tasks
            .filter()
            .statusEqualTo(false)
            .watch(fireImmediately: true) !=
        null) {
      yield* isar!.tasks
          .filter()
          .statusEqualTo(false)
          .watch(fireImmediately: true);
    }
  }

  @override
  Stream<List<Task>> getCompletedTasks() async* {
    if (isar?.tasks.filter().statusEqualTo(true).watch(fireImmediately: true) !=
        null) {
      yield* isar!.tasks
          .filter()
          .statusEqualTo(true)
          .watch(fireImmediately: true);
    }
  }

  @override
  Future<void> addTask(Task task) async {
    Task newTask = task;
    isar?.writeTxnSync<int?>(() => isar?.tasks.putSync(newTask));
  }

  @override
  Future<void> updateTask(Task task) async {
    await isar?.writeTxn(() async {
      final record = await isar?.tasks.get(task.id);

      if (record != null) {
        record.title = task.title;
        record.description = task.description;
        record.dueDate = task.dueDate;
        record.status = task.status;
        await isar?.tasks.put(record);
      }
    });
  }

  @override
  Future<void> deleteTask(Task task) async {
    await isar?.writeTxn(() async {
      await isar?.tasks.delete(task.id);
    });
  }
}

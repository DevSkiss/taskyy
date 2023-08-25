import 'package:isar/isar.dart';
import 'package:my_task_manager/core/isar/collections/task.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  late final Isar _isar;

  Isar get isar => _isar;

  Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [TaskSchema],
      directory: dir.path,
      inspector: true,
    );
  }

  Future<void> closeIsar() async {
    _isar.close();
  }
}

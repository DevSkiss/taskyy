import 'package:isar/isar.dart';

part 'task.g.dart';

@collection
class Task {
  Id id = Isar.autoIncrement;
  String? title;
  String? description;
  String? dueDate;
  bool? status;
}

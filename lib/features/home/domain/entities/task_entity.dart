import 'package:copy_with_extension/copy_with_extension.dart';

part 'task_entity.g.dart';

@CopyWith()
class TaskEntity {
  const TaskEntity({
    this.id,
    this.title,
    this.description,
    this.dueDate,
    this.status,
  });
  final int? id;
  final String? title;
  final String? description;
  final String? dueDate;
  final bool? status;
}

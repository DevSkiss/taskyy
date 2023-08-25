import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:my_task_manager/core/isar/collections/task.dart';
import 'package:my_task_manager/features/home/domain/entities/task_entity.dart';
import 'package:my_task_manager/features/home/domain/usecases/get_local_completed_tasks.dart';
import 'package:my_task_manager/features/home/domain/usecases/get_local_incomplete_tasks.dart';
import 'package:my_task_manager/features/home/presentation/widgets/task_item_widget.dart';
import 'package:my_task_manager/features/task_detail/presentation/screens/task_detail.dart';
import 'package:my_task_manager/generated/assets.gen.dart';
import 'package:my_task_manager/shared/ui_helpers.dart';

class ListTaskWidget extends StatelessWidget {
  const ListTaskWidget({
    super.key,
    this.completed = false,
  });

  final bool completed;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Task>>(
        stream: completed
            ? GetLocalCompletedTasks().getTasksLocally()
            : GetLocalInCompleteTasks().getTasksLocally(),
        builder: ((context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Image.asset(Assets.images.emptyList.path),
            );
          }
          List<Task>? tasks = snapshot.data;
          return ListView.separated(
            padding: const EdgeInsets.only(top: 16),
            itemCount: tasks?.length ?? 0,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) {
              return SizedBox(height: UIHelpers.defaultPadding);
            },
            itemBuilder: (context, index) {
              return OpenContainer(
                openElevation: 0,
                closedElevation: 0,
                closedBuilder: (context, action) {
                  return TaskItemWidget(
                    index: index,
                    task: TaskEntity(
                      id: tasks?[index].id,
                      title: tasks?[index].title,
                      description: tasks?[index].description,
                      dueDate: tasks?[index].dueDate,
                      status: tasks?[index].status,
                    ),
                  );
                },
                openBuilder: (context, action) => TaskDetail(
                  task: TaskEntity(
                    id: tasks?[index].id,
                    title: tasks?[index].title,
                    description: tasks?[index].description,
                    dueDate: tasks?[index].dueDate,
                    status: tasks?[index].status,
                  ),
                ),
              );
            },
          );
        }));
  }
}

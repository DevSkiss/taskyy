import 'package:flutter/material.dart';
import 'package:my_task_manager/features/home/domain/entities/task_entity.dart';
import 'package:my_task_manager/features/home/presentation/widgets/due_date_widget.dart';
import 'package:my_task_manager/shared/shared.dart';
import 'package:my_task_manager/shared/ui_helpers.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({
    super.key,
    required this.index,
    required this.task,
  });

  final int index;
  final TaskEntity task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(UIHelpers.defaultPadding),
      decoration: BoxDecoration(
        color: UIHelpers.getTaskColor(index),
        border: Border.all(color: AppColors.whiteColor),
        borderRadius: BorderRadius.circular(UIHelpers.defaultPadding),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefaultText(
            task.title ?? '',
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: UIHelpers.defaultPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DueDateWidget(task.dueDate ?? ''),
              DefaultText(
                (task.status ?? false) ? 'Completed' : 'Incomplete',
                fontSize: 12,
                color: AppColors.bodyColor,
              )
            ],
          ),
        ],
      ),
    );
  }
}

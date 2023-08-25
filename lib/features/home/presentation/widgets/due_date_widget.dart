import 'package:flutter/material.dart';
import 'package:my_task_manager/shared/shared.dart';
import 'package:my_task_manager/shared/ui_helpers.dart';

class DueDateWidget extends StatelessWidget {
  const DueDateWidget(this.dueDate, {super.key});

  final String dueDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(UIHelpers.xsPadding).copyWith(left: 8, right: 8),
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(UIHelpers.xsPadding)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.calendar_month_outlined,
            color: AppColors.whiteColor,
            size: 16,
          ),
          const SizedBox(width: 3),
          DefaultText(
            'Due Date: $dueDate',
            fontSize: 12,
            color: AppColors.whiteColor,
          )
        ],
      ),
    );
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_task_manager/features/home/domain/entities/task_entity.dart';
import 'package:my_task_manager/features/home/presentation/widgets/due_date_widget.dart';
import 'package:my_task_manager/features/task_detail/presentation/bloc/task_detail_bloc.dart';
import 'package:my_task_manager/features/task_detail/presentation/bloc/task_detail_state.dart';
import 'package:my_task_manager/shared/shared.dart';
import 'package:my_task_manager/shared/ui_helpers.dart';
import 'package:my_task_manager/shared/widgets/keyboard_dismisser.dart';
import 'package:my_task_manager/shared/widgets/scrollable_column.dart';

class TaskDetail extends StatelessWidget {
  const TaskDetail({
    Key? key,
    this.task,
  }) : super(key: key);

  final TaskEntity? task;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskDetailBloc(task: task),
      child: TaskDetailView(task: task),
    );
  }
}

class TaskDetailView extends StatefulWidget {
  const TaskDetailView({
    Key? key,
    this.task,
  }) : super(key: key);

  final TaskEntity? task;

  @override
  State<TaskDetailView> createState() => _TaskDetailViewState();
}

class _TaskDetailViewState extends State<TaskDetailView> {
  bool isCompleted = false;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    if (widget.task != null) {
      titleController.text = widget.task?.title ?? '';
      descriptionController.text = widget.task?.description ?? '';
      isCompleted = widget.task?.status ?? false;
    }
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskDetailBloc, TaskDetailState>(
        listener: (context, state) {},
        builder: (context, state) {
          TaskDetailBloc bloc = context.read<TaskDetailBloc>();
          return KeyboardDismisser(
            child: Scaffold(
              backgroundColor: AppColors.whiteColor,
              appBar: AppBar(
                backgroundColor: AppColors.whiteColor,
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(
                    Icons.close,
                    size: 28,
                    color: AppColors.bodyColor,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                actions: [
                  if (widget.task != null)
                    GestureDetector(
                      onTap: () {
                        bloc
                            .deleteTask(TaskEntity(
                          id: widget.task?.id,
                          title: state.taskEntity?.title,
                          description: state.taskEntity?.description,
                          dueDate: state.taskEntity?.dueDate,
                          status: state.taskEntity?.status,
                        ))
                            .then((value) {
                          titleController.clear();
                          descriptionController.clear();
                          Navigator.of(context).pop();
                        });
                      },
                      child: const Icon(
                        Icons.delete,
                        color: AppColors.bodyColor,
                      ),
                    ),
                  const SizedBox(width: 16),
                ],
              ),
              body: SafeArea(
                child: ScrollableColumn(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  padding: const EdgeInsets.symmetric(horizontal: 22)
                      .copyWith(top: UIHelpers.defaultPadding),
                  children: [
                    DefaultTextfield(
                      'Title goes here...',
                      contentPadding: EdgeInsets.zero,
                      borderColor: AppColors.whiteColor,
                      width: double.infinity,
                      fontSize: 24,
                      controller: titleController,
                      fontWeight: FontWeight.bold,
                      height: 60,
                      onChanged: bloc.onChangedTitle,
                    ),
                    DefaultTextfield(
                      'Description goes here...',
                      contentPadding: EdgeInsets.zero,
                      borderColor: AppColors.whiteColor,
                      width: double.infinity,
                      keyboardType: TextInputType.multiline,
                      fontSize: 16,
                      controller: descriptionController,
                      maxLines: 20,
                      fontWeight: FontWeight.bold,
                      height: 360,
                      onChanged: bloc.onChangedDescription,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Checkbox(
                            value: state.taskEntity?.status,
                            activeColor: AppColors.bodyColor,
                            onChanged: bloc.onChangedStatus,
                          ),
                        ),
                        SizedBox(width: UIHelpers.xsPadding),
                        state.taskEntity?.status ?? false
                            ? FadeIn(
                                duration: const Duration(milliseconds: 200),
                                child: const DefaultText(
                                  'Completed',
                                  fontSize: 14,
                                ),
                              )
                            : FadeInRight(
                                duration: const Duration(milliseconds: 200),
                                child: const DefaultText(
                                  'Incomplete',
                                  fontSize: 14,
                                ),
                              ),
                      ],
                    ),
                    SizedBox(height: UIHelpers.defaultPadding),
                    GestureDetector(
                      onTap: () async {
                        DateTime? selectedTime = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2024),
                        );
                        bloc.onChangedDueDate(selectedTime?.toString() ?? '');
                      },
                      child: DueDateWidget(
                        (state.taskEntity?.dueDate == '' ||
                                state.taskEntity?.dueDate == null)
                            ? 'Select Due Date'
                            : state.taskEntity?.dueDate ?? '',
                      ),
                    ),
                    SizedBox(height: UIHelpers.defaultPadding),
                    Align(
                      alignment: Alignment.center,
                      child: DefaultButton(
                        buttonText: widget.task != null ? 'Update' : 'Save',
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        removeShadow: true,
                        buttonHeight: 40,
                        isEnabled: bloc.validateFields(),
                        buttonWidth: double.infinity,
                        shapeSize: 10,
                        color: AppColors.bodyColor,
                        action: () {
                          if (widget.task == null) {
                            bloc
                                .createTask(TaskEntity(
                              title: state.taskEntity?.title,
                              description: state.taskEntity?.description,
                              dueDate: state.taskEntity?.dueDate,
                              status: state.taskEntity?.status,
                            ))
                                .then((value) {
                              titleController.clear();
                              descriptionController.clear();
                              Navigator.of(context).pop();
                            });
                          } else {
                            bloc
                                .updateTask(TaskEntity(
                              id: widget.task?.id,
                              title: state.taskEntity?.title,
                              description: state.taskEntity?.description,
                              dueDate: state.taskEntity?.dueDate,
                              status: state.taskEntity?.status,
                            ))
                                .then(
                              (value) {
                                titleController.clear();
                                descriptionController.clear();
                                Navigator.of(context).pop();
                              },
                            );
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

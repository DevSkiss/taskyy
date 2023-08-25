import 'package:flutter/material.dart';
import 'package:my_task_manager/shared/constants/app_colors.dart';

class UIHelpers {
  const UIHelpers._();

  static double defaultPadding = 16;
  static double mediumPadding = 12;
  static double smallPadding = 8;
  static double xsPadding = 4;
  static const double maxUiWidth = 484;
  static const double minUiWidth = 321;
  static List<BoxShadow> containerBoxShadow = <BoxShadow>[
    BoxShadow(
      color: AppColors.secondaryColor.withOpacity(0.08),
      spreadRadius: 2,
      blurRadius: 8,
      offset: const Offset(0, 3),
    ),
  ];

  static const List<Color> taskColor = [
    AppColors.colorOne,
    AppColors.colorTwo,
    AppColors.colorThree,
    AppColors.colorFour,
  ];

  static Color getTaskColor(index) {
    return taskColor[index % taskColor.length];
  }
}

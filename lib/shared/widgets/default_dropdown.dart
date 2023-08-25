import 'package:flutter/material.dart';
import 'package:my_task_manager/shared/constants/app_colors.dart';
import 'package:my_task_manager/shared/widgets/default_text.dart';

class DropDownItem {
  int id;
  String name;

  DropDownItem(this.id, this.name);
}

class DefaultDropDown extends StatelessWidget {
  const DefaultDropDown({
    super.key,
    required this.width,
    required this.height,
    required this.list,
    required this.onChanged,
    required this.isEnabled,
    this.fontSize = 16,
    this.fontFamily = 'Campton',
    this.fontWeight = FontWeight.w400,
    this.hint,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    this.margin = EdgeInsets.zero,
  });

  final double width;
  final double height;
  final List<DropDownItem> list;
  final void Function(DropDownItem?) onChanged;
  final String? hint;
  final bool isEnabled;
  final double fontSize;
  final String fontFamily;
  final FontWeight fontWeight;
  final EdgeInsets padding;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    // final ValueNotifier<DropDownItem> _listenable = ValueNotifier(list.first);

    return Container(
      height: height,
      width: width,
      padding: padding,

      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(5),
      ),

      // dropdown below..
      child: IgnorePointer(
        ignoring: !isEnabled,
        child: DropdownButton<DropDownItem>(

            //value: area,
            hint: DefaultText(
              hint ?? '',
              fontSize: fontSize,
              fontFamily: fontFamily,
              fontWeight: fontWeight,
              color: AppColors.secondaryColor,
            ),
            icon: const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.secondaryColor,
            ),
            iconSize: 24,
            isExpanded: true,
            underline: const SizedBox(),
            onChanged: onChanged,
            borderRadius: BorderRadius.circular(4),
            items:
                list.map<DropdownMenuItem<DropDownItem>>((DropDownItem value) {
              return DropdownMenuItem<DropDownItem>(
                value: value,
                child: DefaultText(
                  value.name,
                  color: AppColors.secondaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: fontSize,
                  fontFamily: fontFamily,
                ),
              );
            }).toList()),
      ),
    );
  }
}

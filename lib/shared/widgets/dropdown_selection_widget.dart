import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:my_task_manager/shared/constants/app_colors.dart';
import 'package:my_task_manager/shared/ui_helpers.dart';
import 'package:my_task_manager/shared/widgets/default_text.dart';

class DropdownSelectionWidget extends StatefulWidget {
  const DropdownSelectionWidget({
    Key? key,
    required this.text,
    required this.items,
    required this.onChanged,
    this.value,
    this.leading,
    this.title,
    this.customText,
    this.borderRadius = 8,
    this.buttonHeight = 42,
    this.margin,
    this.icon,
    this.showBorder = true,
    this.errorText,
    this.backgroundColor,
    this.textColor,
    this.iconColor,
    this.dropdownMaxHeight = 400,
    this.itemMaxLine = 1,
    this.buttonWidth = double.infinity,
    this.expanded = false,
    this.onMenuStateChange,
    this.hintFontWeight = FontWeight.w400,
  }) : super(key: key);

  final String? title;
  final String text;
  final String? value;
  final List<String> items;
  final ValueChanged onChanged;
  final Widget? leading;
  final Widget? customText;
  final Widget? icon;
  final double borderRadius;
  final double buttonHeight;
  final EdgeInsets? margin;
  final bool showBorder;
  final String? errorText;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconColor;
  final int itemMaxLine;
  final bool expanded;
  final double dropdownMaxHeight;
  final FontWeight hintFontWeight;
  final double buttonWidth;
  final void Function(bool)? onMenuStateChange;

  @override
  State<DropdownSelectionWidget> createState() =>
      _DropdownSelectionWidgetState();
}

class _DropdownSelectionWidgetState extends State<DropdownSelectionWidget> {
  String? selectedValue;

  @override
  void initState() {
    if (widget.items.contains(widget.value)) {
      selectedValue = widget.value;
    } else {
      selectedValue = null;
    }
    super.initState();
  }

  @override
  void didUpdateWidget(covariant DropdownSelectionWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.items.contains(widget.value)) {
      selectedValue = widget.value;
    } else {
      selectedValue = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (widget.title != null) ...[
          DefaultText(
            widget.title!,
            color: AppColors.secondaryColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(height: 5),
        ],
        DropdownButtonHideUnderline(
          child: Container(
            margin: widget.margin,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Colors.grey.shade700.withOpacity(0.5)))),
            child: DropdownButton2(
              value: selectedValue,
              onMenuStateChange: widget.onMenuStateChange,
              isExpanded: widget.expanded,
              isDense: true,
              hint: Row(
                children: [
                  if (widget.leading != null) widget.leading!,
                  widget.customText ??
                      DefaultText(
                        widget.text,
                        fontSize: 12,
                        color: widget.textColor ??
                            AppColors.secondaryColor.withOpacity(0.6),
                      ),
                ],
              ),
              items: widget.items
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: DefaultText(
                          item,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.secondaryColor,
                          maxLines: widget.itemMaxLine,
                        ),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
                widget.onChanged(value);
              },
              icon: widget.icon ??
                  const Icon(
                    Icons.keyboard_arrow_down,
                    size: 24,
                  ),
              iconSize: 18,
              iconEnabledColor: widget.iconColor ?? AppColors.secondaryColor,
              iconDisabledColor: Colors.grey,
              buttonHeight: widget.buttonHeight,
              buttonWidth: widget.buttonWidth,
              buttonPadding: EdgeInsets.zero,
              focusColor: AppColors.secondaryColor,
              itemPadding: const EdgeInsets.only(left: 14, right: 14),
              dropdownMaxHeight: widget.dropdownMaxHeight,
              dropdownWidth: null,
              dropdownFullScreen: true,
              dropdownElevation: 8,
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: UIHelpers.containerBoxShadow,
              ),
              scrollbarRadius: const Radius.circular(40),
              scrollbarThickness: 3,
              scrollbarAlwaysShow: true,
              offset: const Offset(0, -5),
              selectedItemBuilder: (context) {
                return widget.items
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: DefaultText(
                            item,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: widget.textColor ?? AppColors.secondaryColor,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList();
              },
            ),
          ),
        ),
        if (widget.errorText != null && selectedValue == null) ...[
          const SizedBox(height: 4),
          Align(
            alignment: Alignment.center,
            child: DefaultText(
              widget.errorText!,
              color: Colors.red,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ],
    );
  }
}

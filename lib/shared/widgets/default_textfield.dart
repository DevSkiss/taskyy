import 'package:flutter/material.dart';
import 'package:my_task_manager/generated/fonts.gen.dart';
import 'package:my_task_manager/shared/constants/app_colors.dart';
import 'package:my_task_manager/shared/widgets/default_text.dart';

class DefaultTextfield extends StatelessWidget {
  const DefaultTextfield(
    this.hintText, {
    Key? key,
    required this.width,
    required this.height,
    this.fillColor = Colors.white,
    this.borderColor = AppColors.secondaryColor,
    this.focusColor = Colors.black54,
    this.prefixIcon,
    this.maxLines,
    this.minLines,
    this.focusNode,
    this.suffixIcon,
    this.controller,
    this.obscureText = false,
    this.isEnabled = true,
    this.hasError = false,
    this.errorText,
    this.fontColor = Colors.black87,
    this.fontWeight = FontWeight.normal,
    this.keyboardType = TextInputType.text,
    this.fontFamily = FontFamily.poppins,
    this.borderRadius = 4.0,
    this.onChanged,
    this.expands,
    this.fontSize = 14,
    this.contentPadding = const EdgeInsets.symmetric(
      vertical: 5,
      horizontal: 15,
    ),
  }) : super(key: key);

  final double width;
  final double height;
  final int? maxLines;
  final int? minLines;
  final String hintText;
  final String fontFamily;
  final Color fillColor;
  final bool? expands;
  final bool? hasError;
  final String? errorText;
  final Color borderColor;
  final Color focusColor;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final bool obscureText;
  final Color fontColor;
  final FontWeight fontWeight;
  final bool isEnabled;
  final double borderRadius;
  final EdgeInsets contentPadding;
  final TextInputType keyboardType;
  final void Function(String)? onChanged;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: width,
          height: height,
          child: TextField(
            expands: expands ?? false,
            minLines: minLines,
            focusNode: focusNode,
            maxLines: maxLines,
            enabled: isEnabled,
            controller: controller,
            obscureText: obscureText,
            onChanged: onChanged,
            keyboardType: keyboardType,
            style: TextStyle(
              fontSize: fontSize,
              color: isEnabled ? fontColor : Colors.black87,
              fontWeight: fontWeight,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: fontSize,
                color: Colors.black38,
                fontWeight: fontWeight,
                fontFamily: fontFamily,
              ),
              fillColor: (errorText != null || (hasError ?? false))
                  ? Colors.red.withOpacity(.15)
                  : fillColor,
              filled: true,
              contentPadding: contentPadding,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              // enabledBorder: UnderlineInputBorder(
              //   borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              //   borderSide: BorderSide(
              //     color: (errorText != null || (hasError ?? false))
              //         ? Colors.red
              //         : borderColor,
              //   ),
              // ),
              // focusedBorder: UnderlineInputBorder(
              //   borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              //   borderSide: BorderSide(
              //     color: (errorText != null || (hasError ?? false))
              //         ? Colors.red
              //         : focusColor,
              //   ),
              // ),
              // disabledBorder: UnderlineInputBorder(
              //   borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              //   borderSide: const BorderSide(color: Colors.white70),
              // ),
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
            ),
          ),
        ),
        if (errorText != null) ...[
          const SizedBox(height: 5),
          DefaultText(
            errorText!,
            color: Colors.red,
            fontSize: 12,
            fontFamily: 'Inter',
            maxLines: 4,
          )
        ]
      ],
    );
  }
}

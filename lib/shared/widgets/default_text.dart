import 'package:flutter/material.dart';
import 'package:my_task_manager/generated/fonts.gen.dart';

class DefaultText extends StatelessWidget {
  const DefaultText(
    this.text, {
    Key? key,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 12,
    this.overflow = TextOverflow.ellipsis,
    this.decoration = TextDecoration.none,
    this.maxLines = 1,
    this.color = Colors.black87,
    this.textAlign,
    this.letterSpacing,
    this.fontStyle = FontStyle.normal,
    this.fontFamily = FontFamily.poppins,
  }) : super(key: key);

  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final int maxLines;
  final TextOverflow overflow;
  final Color color;
  final TextDecoration decoration;
  final FontStyle fontStyle;
  final TextAlign? textAlign;
  final String? fontFamily;
  final double? letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontStyle: fontStyle,
        letterSpacing: letterSpacing,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        decoration: decoration,
      ),
      textScaleFactor: 1.0,
      maxLines: maxLines,
    );
  }
}

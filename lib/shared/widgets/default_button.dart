import 'package:flutter/material.dart';
import 'package:my_task_manager/generated/fonts.gen.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    this.buttonText,
    Key? key,
    this.color = Colors.blue,
    this.textColor,
    this.action,
    this.isEnabled = true,
    this.unSelected = true,
    this.removeShadow = false,
    this.fontSize,
    this.alignment,
    this.padding = const EdgeInsets.all(0),
    this.buttonPadding = const EdgeInsets.all(0),
    this.disabledColor = Colors.grey,
    this.disabledTextColor = Colors.white,
    this.shapeSize = 24,
    this.buttonWidth,
    this.buttonHeight = 47,
    this.rightIcon,
    this.rightIconLeftMargin = 5.0,
    this.hasBorderSide = false,
    this.borderColor = Colors.white,
    this.leftIcon,
    this.leftIconLeftMargin = 5.0,
    this.iconColor,
    this.fontWeight = FontWeight.w400,
  }) : super(key: key);

  static Widget outlined(
    String buttonText, {
    required void Function()? onPressed,
    double height = 36,
    TextStyle style = const TextStyle(
      color: Colors.white,
    ),
  }) {
    return SizedBox(
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          side: const BorderSide(
            width: 1,
            color: Colors.white,
          ),
        ),
        child: Text(
          buttonText,
          style: style,
        ),
      ),
    );
  }

  final String? buttonText;
  final Color? color;
  final Color? textColor;
  final VoidCallback? action;
  final bool isEnabled;
  final bool removeShadow;
  final bool unSelected;
  final double? fontSize;
  final Alignment? alignment;
  final EdgeInsets padding;
  final EdgeInsets buttonPadding;
  final Color disabledColor;
  final Color disabledTextColor;
  final double shapeSize;
  final double? buttonWidth;
  final double? buttonHeight;
  final IconData? rightIcon;
  final double rightIconLeftMargin;
  final bool hasBorderSide;
  final IconData? leftIcon;
  final double leftIconLeftMargin;
  final Color? iconColor;
  final Color borderColor;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return alignment == null
        ? _getRaisedButton()
        : Align(
            alignment: alignment!,
            child: _getRaisedButton(),
          );
  }

  Widget _getRaisedButton() {
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (_) => isEnabled
                ? hasBorderSide
                    ? Colors.transparent
                    : color ?? Colors.transparent
                : disabledColor,
          ),
          elevation: MaterialStateProperty.resolveWith<double>(
              (Set<MaterialState> states) => removeShadow ? 0 : 3),
          padding: MaterialStateProperty.resolveWith<EdgeInsets>(
              (_) => buttonPadding),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            hasBorderSide
                ? RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(shapeSize),
                    side: BorderSide(color: borderColor),
                  )
                : RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(shapeSize),
                  ),
          ),
        ),
        onPressed: isEnabled ? action : null,
        child: Padding(
          padding: padding,
          child: FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (leftIcon != null)
                  Icon(
                    leftIcon,
                    size: 16,
                    color: iconColor ?? _getFontColor(),
                  ),
                if (leftIcon != null) SizedBox(width: leftIconLeftMargin),
                if (buttonText != null)
                  Text(
                    buttonText!,
                    style: TextStyle(
                      color: textColor ?? _getFontColor(),
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                      fontFamily: FontFamily.poppins,
                    ),
                    textAlign: TextAlign.center,
                  ),
                if (rightIcon != null) SizedBox(width: rightIconLeftMargin),
                if (rightIcon != null)
                  Icon(
                    rightIcon,
                    size: 16,
                    color: iconColor ?? _getFontColor(),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getFontColor() {
    if (isEnabled) {
      if (unSelected) {
        return Colors.white;
      } else {
        return Colors.black87;
      }
    } else {
      return disabledTextColor;
    }
  }
}

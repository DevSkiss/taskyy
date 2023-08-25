import 'package:flutter/material.dart';
import 'package:my_task_manager/shared/ui_helpers.dart';

class ContainerShadowWidget extends StatelessWidget {
  const ContainerShadowWidget({
    super.key,
    required this.child,
    this.color = Colors.white,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.shapeSize = 6,
    this.removeShadow = false,
    this.hasBorderRadius = true,
    this.border,
    this.showBorder = true,
    this.constraints,
  });

  final Widget child;
  final Color color;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double shapeSize;
  final bool removeShadow;
  final bool hasBorderRadius;
  final BoxBorder? border;
  final bool showBorder;
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      width: width,
      height: height,
      constraints: constraints,
      decoration: showBorder
          ? BoxDecoration(
              borderRadius:
                  hasBorderRadius ? BorderRadius.circular(shapeSize) : null,
              color: color,
              border: border ?? Border.all(color: Colors.grey.shade700),
              boxShadow: removeShadow ? null : UIHelpers.containerBoxShadow,
            )
          : null,
      child: child,
    );
  }
}

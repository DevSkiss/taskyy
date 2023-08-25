import 'package:flutter/material.dart';

class RowPadding extends StatelessWidget {
  const RowPadding(
      {Key? key,
      required this.children,
      this.padding = EdgeInsets.zero,
      this.mainAxisAlignment = MainAxisAlignment.start,
      this.crossAxisAlignment = CrossAxisAlignment.start})
      : super(key: key);
  final EdgeInsets padding;
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: children,
      ),
    );
  }
}

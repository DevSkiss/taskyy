import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  const LoadingContainer({
    Key? key,
    required this.isLoading,
    required this.child,
    this.loaderWidget = const CircularProgressIndicator.adaptive(),
  }) : super(key: key);

  final bool isLoading;
  final Widget child;
  final Widget loaderWidget;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      isLoading ? Center(child: loaderWidget) : child,
    ]);
  }
}

import 'package:flutter/material.dart';
import 'package:gemak/utulity/http_helper.dart';

class ContextWidget extends InheritedWidget {
  final HttpHelper httpHelper;

  const ContextWidget({
    super.key,
    required Widget child,
    required this.httpHelper,
  }) : super(child: child);

  static ContextWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType(aspect: ContextWidget);
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}

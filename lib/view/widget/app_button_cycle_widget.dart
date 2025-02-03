import 'package:flutter/material.dart';

class AppButtonCycleWidget extends StatelessWidget {
  final Widget child;
  final bool isCycle;
  final double? padding;

  const AppButtonCycleWidget({
    super.key,
    required this.child,
    this.isCycle = true,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return isCycle
        ? Container(
            padding: EdgeInsets.all(padding ?? 6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black.withOpacity(0.4),
            ),
            child: child,
          )
        : child;
  }
}

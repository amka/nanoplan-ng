import 'package:flutter/material.dart';

class Constrained extends StatelessWidget {
  final Widget? child;
  final double maxWidth;
  final EdgeInsets? padding;

  const Constrained({
    super.key,
    this.child,
    this.padding,
    this.maxWidth = 360,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: child,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:uidesign/utils/constants.dart';

class Bordericon extends StatelessWidget {
  final double? height, width;
  final EdgeInsets? padding;
  final Widget child;
  final Color ?color;

  const Bordericon({super.key, this.height, this.width, this.padding,  this.color, required this.child});



  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color ?? COLOR_WHITE,
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          border: Border.all(color: COLOR_GREY.withAlpha(40), width: 2)),
      padding: padding ?? const EdgeInsets.all(8.0),
      child: Center(child: child),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
  final Widget? child;
  final Color? color;
  const CustomCard({super.key, this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return  Card(
      color: color,
      elevation: 3,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6)),
      child: child,
    );
  }
}

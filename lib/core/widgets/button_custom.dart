import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/constant.dart' show kPrimaryColor;
import 'text_custom.dart';

class ButtonCustom extends StatelessWidget {
  const ButtonCustom({
    super.key,
    this.onPressed,
    this.width,
    this.height,
    required this.title,
    this.fontSize,
    this.fontWeight,
    this.fontColor,
    this.backgroundColor,
    this.border,
    this.borderRadius,
  });

  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? fontColor;
  final Color? backgroundColor;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: width ?? 200.w,
        height: height ?? 40.h,
        decoration: BoxDecoration(
          color: backgroundColor ?? kPrimaryColor,
          borderRadius: borderRadius ?? BorderRadius.circular(10.r),
          border: border,
        ),
        child: TextButton(
          onPressed: onPressed ?? () {},
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all(Colors.white),
            overlayColor: WidgetStateProperty.all(
              Colors.white.withValues(alpha: 0.3),
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(10.r),
              ),
            ),
          ),
          child: TextCustom(
            title,
            size: fontSize ?? 14.sp,
            weight: fontWeight ?? FontWeight.bold,
            color: fontColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/constant.dart';

class TextCustom extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final TextAlign align;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final String? family;

  const TextCustom(
    this.text, {
    super.key,
    this.size,
    this.color,
    this.weight,
    this.align = TextAlign.center,
    this.maxLines,
    this.overflow,
    this.decoration,
    this.family,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontFamily: family ?? kFontPoppins,
        color: color ?? Colors.white,
        fontSize: size ?? 12.sp,
        fontWeight: weight ?? FontWeight.w400,
        decoration: decoration,
      ),
    );
  }
}

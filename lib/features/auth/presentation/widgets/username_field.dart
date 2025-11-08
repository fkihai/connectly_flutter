import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/constant.dart';

class UsernameField extends StatelessWidget {
  const UsernameField({super.key, this.controller, this.height, this.color});
  final TextEditingController? controller;

  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 70.h,
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0.dm),
        color: color ?? kPrimaryColor.withValues(alpha: 0.04),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          style: TextStyle(
            fontSize: 14.sp,
            fontFamily: kFontPoppins,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            icon: Icon(Icons.person_2_outlined, size: 25.r),
            isDense: true,
            iconColor: Colors.grey.shade400,
            hintText: "Enter your username",
            hintStyle: TextStyle(
              fontSize: 14.sp,
              fontFamily: kFontPoppins,
              color: Colors.grey..shade300,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

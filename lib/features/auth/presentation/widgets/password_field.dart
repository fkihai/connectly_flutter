import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/constant.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, this.controller, this.height, this.color});

  final double? height;
  final Color? color;
  final TextEditingController? controller;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 70.h,
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0.dm),
        color: widget.color ?? kPrimaryColor.withValues(alpha: 0.04),
      ),
      child: Center(
        child: TextField(
          obscureText: _isPasswordVisible,
          controller: widget.controller,
          style: TextStyle(
            fontSize: 14.sp,
            fontFamily: kFontPoppins,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            icon: Icon(Icons.lock_outlined, size: 25.r),
            isDense: true,
            iconColor: Colors.grey.shade400,
            hintText: "Enter your password",
            hintStyle: TextStyle(
              fontSize: 14.sp,
              fontFamily: kFontPoppins,
              color: Colors.grey..shade300,
            ),
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
              child: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey.shade400,
                size: 25.r,
              ),
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 20.h),
          ),
        ),
      ),
    );
  }
}

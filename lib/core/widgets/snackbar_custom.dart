import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'text_custom.dart';

enum SnackBarType { info, success, warning, error }

class SnackbarCustom {
  static void show(
    BuildContext context, {
    required String message,
    SnackBarType type = SnackBarType.info,
    Color backgroundColor = Colors.red,
    Color textColor = Colors.white,
  }) {
    final Map<SnackBarType, Map<String, dynamic>> typeMap = {
      SnackBarType.info: {'title': 'Info', 'icon': Icons.info_outline},
      SnackBarType.success: {
        'title': 'Success',
        'icon': Icons.check_circle_outline,
      },
      SnackBarType.warning: {
        'title': 'Warning',
        'icon': Icons.warning_amber_outlined,
      },
      SnackBarType.error: {'title': 'Error', 'icon': Icons.error_outline},
    };

    final config = typeMap[type]!;

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: backgroundColor.withValues(alpha: 1.0),
      elevation: 6,
      duration: const Duration(seconds: 2),
      content: Row(
        children: [
          Icon(config['icon'], color: Colors.white, size: 25.r),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextCustom(
                  config['title'],
                  size: 14.sp,
                  color: textColor,
                  weight: FontWeight.bold,
                ),
                SizedBox(height: 2.h),
                TextCustom(
                  message,
                  size: 14.sp,
                  color: textColor,
                  weight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ],
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

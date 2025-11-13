import 'package:connectly_flutter/core/widgets/text_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextCustom(
          "THIS IS DASHBOAD",
          weight: FontWeight.bold,
          size: 30.sp,
          color: Colors.black,
        ),
      ),
    );
  }
}

import 'package:connectly_flutter/core/utils/constant.dart';
import 'package:connectly_flutter/core/widgets/button_custom.dart';
import 'package:connectly_flutter/core/widgets/text_custom.dart';
import 'package:connectly_flutter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:connectly_flutter/features/auth/presentation/bloc/auth_event.dart';
import 'package:connectly_flutter/features/auth/presentation/bloc/auth_state.dart';
import 'package:connectly_flutter/features/auth/presentation/widgets/password_field.dart';
import 'package:connectly_flutter/features/auth/presentation/widgets/username_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => context.read<AuthBloc>()..add(CheckAunthenticated()),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          debugPrint("current state: $state");
          if (state is LoginSuccess) {
            context.goNamed('dashboard');
          }
        },
        child: Scaffold(
          backgroundColor: ksecondaryColor.withValues(alpha: 0.05),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 150.w, vertical: 80.h),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.r),
                      bottomLeft: Radius.circular(10.r),
                    ),
                  ),
                  child: Stack(
                    alignment: AlignmentGeometry.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.r),
                          bottomLeft: Radius.circular(10.r),
                        ),
                        child: Image.asset(
                          "assets/images/background_login.png",
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextCustom(
                            "HELLO THERE!",
                            size: 26.sp,
                            weight: FontWeight.bold,
                          ),
                          SizedBox(height: 9.h),
                          TextCustom(
                            "Join us today and start managing your\nIoT devices with ease",
                            size: 12.sp,
                          ),
                          SizedBox(height: 60.h),
                          ButtonCustom(
                            height: 39,
                            title: "SIGN UP",
                            backgroundColor: Colors.transparent,
                            border: Border.all(width: 1.0, color: Colors.white),
                            fontWeight: FontWeight.w500,
                            borderRadius: BorderRadius.circular(40.r),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 200.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.r),
                        bottomRight: Radius.circular(10.r),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextCustom(
                          "SIGN IN",
                          size: 26.sp,
                          weight: FontWeight.bold,
                          color: kPrimaryColor,
                        ),
                        SizedBox(height: 20.h),
                        TextCustom(
                          "To keep connected with us plase login with your personal info",
                          // size: 16.sp,
                          // weight: FontWeight.400,
                          color: ksecondaryColor,
                        ),
                        SizedBox(height: 60.h),
                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            final error = state is LoginFailure;
                            if (error) {
                              return Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.error_outline,
                                          color: Colors.red.shade900,
                                          size: 20.r,
                                        ),
                                        SizedBox(width: 5.w),
                                        TextCustom(
                                          "login failed! ${state.message}",
                                          align: TextAlign.start,
                                          size: 14.sp,
                                          weight: FontWeight.w500,
                                          color: Colors.red.shade900,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20.h),
                                  ],
                                ),
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                        UsernameField(controller: _usernameController),
                        SizedBox(height: 20.h),
                        PasswordField(controller: _passwordController),
                        SizedBox(height: 80.h),
                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (BuildContext context, AuthState state) {
                            final loading = state is LoginLoading;
                            if (loading) {
                              return CircularProgressIndicator();
                            } else {
                              return ButtonCustom(
                                title: "SIGN IN",
                                height: 40,
                                width: double.infinity,
                                fontWeight: FontWeight.w600,
                                borderRadius: BorderRadius.circular(10.r),
                                onPressed: () {
                                  context.read<AuthBloc>().add(
                                    LoginButtonOnPressed(
                                      _usernameController.text,
                                      _passwordController.text,
                                    ),
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

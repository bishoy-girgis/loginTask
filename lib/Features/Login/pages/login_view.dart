import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_login/Core/extentions/extentions.dart';
import 'package:task_login/Features/Login/manager/cubit.dart';
import 'package:task_login/Features/Login/widgets/custom_card.dart';
import 'package:task_login/Features/Login/widgets/custom_textfield.dart';

import '../../../Core/services/cache_helper.dart';
import '../../../Core/services/toast.dart';
import '../manager/states.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {
            if (state is LoginLoadingState) {
              EasyLoading.show();
            } else if (state is LoginErrorState) {
              EasyLoading.dismiss();
              errorToast(context,description: "Please check again your E-mail or Password");
            } else if (state is LoginSuccessState) {
              EasyLoading.dismiss();
               CacheHelper.saveData(key: "userToken", value: state.user.token);
              successToast(context,description: "Login Successfully",title: "Login");
            }
          },
          builder: (context, state) {
            var theme = Theme.of(context);
            var mediaQuery = MediaQuery.of(context).size;
            var cubit = LoginCubit().get(context);
            return Form(
              key: formKey,
              child: Scaffold(
                body: Container(
                  width: mediaQuery.width,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 150.h,
                        ),
                        Text(
                          "Welcome Back !",
                          style: theme.textTheme.headlineLarge,
                        ).setCenter(),
                        SizedBox(
                          height: 7.h,
                        ),
                        Text(
                          "Login to continue Radio App",
                          style: theme.textTheme.headlineMedium,
                        ).setCenter(),
                        SizedBox(
                          height: 32.h,
                        ),
                        CustomTextField(
                          controller: cubit.emailController,
                          onValidate: (String? value) {
                            if (value == null || value.trim().isEmpty) {
                              return "you must enter your e-mail";
                            } else {
                              return null;
                            }
                          },
                          hint: "Email Address",
                          prefix: Icon(Icons.email_outlined,
                              color: theme.primaryColor),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextField(
                          controller: cubit.passwordController,
                          onValidate: (String? value) {
                            if (value == null || value.trim().isEmpty) {
                              return "you must enter your password";
                            } else if (value.length < 6) {
                              return "description cant be less than 6 characters";
                            } else {
                              return null;
                            }
                          },
                          hint: "Password",
                          isPassword: true,
                          prefix: Icon(Icons.lock, color: theme.primaryColor),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () => cubit.RememberMe(),
                                  child: Container(
                                    height: 18.h,
                                    width: 18.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: const Color(0XFFCED0D2)),
                                    ),
                                    child: cubit.rememberMe
                                        ? const Icon(
                                            CupertinoIcons.checkmark_alt,
                                            color: Color(0XFFF9567E),
                                            size: 17,
                                          ).setCenter()
                                        : Container(),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  "Remember me",
                                  style: theme.textTheme.bodyMedium,
                                ),
                              ],
                            ),
                            Text(
                              "Forgot Password ?",
                              style: theme.textTheme.bodyMedium
                                  ?.copyWith(color: const Color(0XFF5C5E6F)),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        InkWell(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              cubit.logIn();
                            }
                          },
                          child: CustomCard(
                            color: theme.primaryColor,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.h),
                              child: Text("Log In",
                                      style: theme.textTheme.bodyLarge)
                                  .setCenter(),
                            ),
                          ),
                        ),
                        Text(
                          "OR",
                          style: theme.textTheme.bodyMedium,
                        )
                            .setPadding(context,
                                enableMediaQuery: false, vertical: 15.h)
                            .setCenter(),
                        CustomCard(
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 12.w),
                                width: 28.w,
                                height: 28.h,
                                child: Image.network(
                                    'http://pngimg.com/uploads/google/google_PNG19635.png',
                                    fit: BoxFit.cover),
                              ),
                              Text("Continue with Google",
                                  style: theme.textTheme.bodyMedium),
                            ],
                          ).setPadding(context,
                              enableMediaQuery: false, vertical: 20.h),
                        ),
                        CustomCard(
                          color: Colors.black,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 12.w),
                                width: 35.w,
                                height: 35.h,
                                child: Image.network(
                                    'https://pngimg.com/uploads/apple_logo/apple_logo_PNG19692.png',
                                    fit: BoxFit.cover),
                              ),
                              Text("Sign In with Apple ID",
                                  style: theme.textTheme.bodyMedium
                                      ?.copyWith(color: Colors.white)),
                            ],
                          ).setPadding(context,
                              enableMediaQuery: false, vertical: 20.h),
                        ).setPadding(context,
                            enableMediaQuery: false, vertical: 20.h),
                        CustomCard(
                          color: const Color(0XFF39579A),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 12.w),
                                width: 35.w,
                                height: 35.h,
                                child: Image.network(
                                    'https://pngimg.com/uploads/facebook_logos/facebook_logos_PNG19751.png',
                                    fit: BoxFit.cover),
                              ),
                              Text("Continue with Facebook",
                                  style: theme.textTheme.bodyMedium
                                      ?.copyWith(color: Colors.white)),
                            ],
                          ).setPadding(context,
                              enableMediaQuery: false, vertical: 20.h),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: theme.textTheme.bodyMedium,
                            ),
                            Text("Sign up",
                                style: theme.textTheme.bodyMedium
                                    ?.copyWith(color: theme.primaryColor)),
                          ],
                        ).setPadding(context,
                            enableMediaQuery: false, vertical: 15.h),
                        Text(
                          "By signing up you indicate that you have read and\nagreed to the Patch Terms of Service",
                          style: theme.textTheme.bodySmall,
                          textAlign: TextAlign.center,
                        ).setCenter()
                      ],
                    ).setPadding(context,
                        horizontal: 30.w, enableMediaQuery: false),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

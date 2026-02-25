import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/core/shared_widgets/app_text_button.dart';
import 'package:flutter_advanced_course/core/shared_widgets/app_textform_field.dart';
import 'package:flutter_advanced_course/core/theming/colors.dart';
import 'package:flutter_advanced_course/core/theming/styles.dart';
import 'package:flutter_advanced_course/features/login/data/models/login_request_body.dart';
import 'package:flutter_advanced_course/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_advanced_course/features/login/ui/widgets/already_have_account.dart';
import 'package:flutter_advanced_course/features/login/ui/widgets/build_bloc_listener.dart';
import 'package:flutter_advanced_course/features/login/ui/widgets/check_and_forget_text.dart';
import 'package:flutter_advanced_course/features/login/ui/widgets/email_and_password.dart';
import 'package:flutter_advanced_course/features/login/ui/widgets/socail_media_icon.dart';
import 'package:flutter_advanced_course/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter_advanced_course/features/login/ui/widgets/title_and_description_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isSecuredText = true;
  bool isRememberMeChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
                child: const TitleAndDescriptionText(),
              ),

              SizedBox(height: 30.h),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  children: [
                    const EmailAndPassword(),
                    SizedBox(height: 10.h),
                    CheckAndForgetText(
                      isChecked: isRememberMeChecked,
                      onCheckedCheanged: (value) {
                        setState(() {
                          isRememberMeChecked = value!;
                        });
                      },
                    ),
                    SizedBox(height: 30.h),
                    AppTextButton(
                      text: "Login",
                      onButtonClicked: () {
                        validateThenLogin(context);
                      },
                    ),

                    SizedBox(height: 30.h),
                  ],
                ),
              ),

              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1.h,
                      endIndent: 16.w,
                      indent: 30.w,
                      color: ColorsManager.checkGray,
                    ),
                  ),
                  //const Text('mohamed'),
                  Text("Or Sign in with", style: TextStyles.font12GrayRegular),
                  Expanded(
                    child: Divider(
                      thickness: 1.h,
                      endIndent: 30.w,
                      indent: 16.w,
                      color: ColorsManager.checkGray,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocailMediaIcon(
                    onPressed: () {},
                    imageIcon: "assets/images/google_icon.png",
                  ),
                  SizedBox(width: 30.w),
                  SocailMediaIcon(
                    onPressed: () {},
                    imageIcon: "assets/images/facebook_icon.png",
                  ),
                  SizedBox(width: 30.w),
                  SocailMediaIcon(
                    onPressed: () {},
                    imageIcon: "assets/images/apple_icon.png",
                  ),
                ],
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),

                child: const TermsAndConditionsText(),
              ),

              Container(
                margin: EdgeInsets.only(bottom: 30.h),

                child: const AlreadyHaveAccount(),
              ),
              const BuildBlocListener(),
            ],
          ),
        ),
      ),
    );
  }

  void validateThenLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates(
        LoginRequestBody(
          email: context.read<LoginCubit>().emailController.text,
          password: context.read<LoginCubit>().passwordController.text,
        ),
      );
    }
  }
}

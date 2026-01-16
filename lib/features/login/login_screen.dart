import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/core/shared_widgets/app_text_button.dart';
import 'package:flutter_advanced_course/core/shared_widgets/app_textform_field.dart';
import 'package:flutter_advanced_course/core/theming/colors.dart';
import 'package:flutter_advanced_course/core/theming/styles.dart';
import 'package:flutter_advanced_course/features/login/widgets/already_have_account.dart';
import 'package:flutter_advanced_course/features/login/widgets/check_and_forget_text.dart';
import 'package:flutter_advanced_course/features/login/widgets/socail_media_icon.dart';
import 'package:flutter_advanced_course/features/login/widgets/terms_and_conditions_text.dart';
import 'package:flutter_advanced_course/features/login/widgets/title_and_description_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

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
                child: TitleAndDescriptionText(),
              ),

              SizedBox(height: 30.h),
              Form(
                key: _formKey,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    children: [
                      AppTextformField(hintText: "Email"),
                      SizedBox(height: 20.h),
                      AppTextformField(
                        hintText: "Password",
                        obscureText: isSecuredText,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isSecuredText = !isSecuredText;
                            });
                          },
                          child: Icon(
                            isSecuredText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
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
                      AppTextButton(text: "Login", onButtonClicked: () {}),

                      SizedBox(height: 30.h),
                    ],
                  ),
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

                child: TermsAndConditionsText(),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30.h),

                child: AlreadyHaveAccount(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

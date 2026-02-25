import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/core/helpers/app_regex.dart';
import 'package:flutter_advanced_course/core/shared_widgets/app_textform_field.dart';
import 'package:flutter_advanced_course/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_advanced_course/features/login/ui/widgets/password_validations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObsecuredText = true;
  bool hasUppercase = false;
  bool hasLowercase = false;
  bool hasNumber = false;
  bool hasSpecailCharacters = false;
  bool hasMinLenght = false;
  late TextEditingController passwordController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    emailController = context.read<LoginCubit>().emailController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      print('here');
      String password = passwordController.text;
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(password);
        hasUppercase = AppRegex.hasUpperCase(password);
        hasMinLenght = AppRegex.hasMinLength(password);
        hasNumber = AppRegex.hasNumber(password);
        hasSpecailCharacters = AppRegex.hasSpecialCharacter(password);
      });
    });
  }

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextformField(
            hintText: "Email",
            vaildator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
            controller: emailController,
          ),
          SizedBox(height: 20.h),
          AppTextformField(
            hintText: "Password",
            obscureText: isObsecuredText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObsecuredText = !isObsecuredText;
                });
              },
              child: Icon(
                isObsecuredText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            vaildator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
            controller: passwordController,
          ),
          SizedBox(height: 10.h),
          PasswordValidations(
            hasUppercase: hasUppercase,
            hasLowercase: hasLowercase,
            hasNumber: hasNumber,
            hasSpecailCharacters: hasSpecailCharacters,
            hasMinLenght: hasMinLenght,
          ),
        ],
      ),
    );
  }
}

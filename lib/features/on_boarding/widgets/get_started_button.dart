import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/core/helpers/extensions.dart';
import 'package:flutter_advanced_course/core/routing/routes.dart';
import 'package:flutter_advanced_course/core/theming/colors.dart';
import 'package:flutter_advanced_course/core/theming/styles.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          context.pushNamed(Routes.loginScreen);
        },
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(ColorsManager.mainBlue),
          //foregroundColor: MaterialStateProperty.all(Colors.white),
          foregroundColor: WidgetStatePropertyAll(Colors.white),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
          minimumSize: WidgetStateProperty.all(const Size(double.infinity, 52)),
        ),
        child: Text('Get Started', style: TextStyles.font16WhiteSemiBold),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/core/theming/styles.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "Already have an account yet?",
        style: TextStyles.font12GrayRegular,
        children: [
          TextSpan(
            text: " Sign Up ",
            style: TextStyles.font14BlueRegular,
          ),
        
        ],
      ),
    );
  }
}

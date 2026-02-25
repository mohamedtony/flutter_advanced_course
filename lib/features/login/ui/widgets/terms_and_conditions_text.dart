import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/core/theming/styles.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return  RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "By logging, you agree to our ",
        style: TextStyles.font12GrayRegular,
        children: [
          TextSpan(
            text: "Terms & Conditions ",
            style: TextStyles.font12BlackMedium,
          ),
          TextSpan(text: "and", style: TextStyles.font12GrayRegular),
          TextSpan(
            text: " PrivacyPolicy.",
            style: TextStyles.font12BlackMedium.copyWith(height: 1.4),
          ),
        ],
      ),
    );
  }
}

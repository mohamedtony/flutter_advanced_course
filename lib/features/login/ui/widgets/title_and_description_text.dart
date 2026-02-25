import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class TitleAndDescriptionText extends StatelessWidget {
  const TitleAndDescriptionText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Welcom Back", style: TextStyles.font24BlueBold),
        SizedBox(height: 10.h),
        // Gap(8.h),
        Text(
          "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
          style: TextStyles.font14GrayRegular,
        ),
      ],
    );
  }
}

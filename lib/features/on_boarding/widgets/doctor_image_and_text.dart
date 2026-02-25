import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorImageAndText extends StatelessWidget {
  const DoctorImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset('assets/svgs/docdoc_logo_low_opacity.svg'),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.white.withAlpha(0)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [0.14, 0.6],
            ),
          ),
          child: Image.asset('assets/images/onboarding_doc_image.png'),
        ),
        const Text("hi"),
        Positioned(
          bottom: 30.0.h,
          right: 0.0,
          left: 0.0,

          child: Text(
            'Best Doctor \n Appointment App',
            textAlign: TextAlign.center,
            style: TextStyles.font32BlueBold.copyWith(height: 1.4),
          ),

    
        ),
      ],
    );
  }
}

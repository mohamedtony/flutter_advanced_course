import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/core/theming/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocailMediaIcon extends StatelessWidget {
  final VoidCallback onPressed;
  final String imageIcon;
  const SocailMediaIcon({
    super.key,
    required this.onPressed,
    required this.imageIcon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: CircleBorder(),
      //borderRadius: BorderRadius.circular(70.0),
      //splashColor: Colors.green,
      onTap: onPressed,
      child: Ink(
        height: 50.h,
        width: 50.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorsManager.socialGray,
        ),
        padding: EdgeInsets.all(10),

        child: Image.asset(imageIcon, height: 24.h, width: 24.w),
      ),
    );

    // return Material(
    //   shape: const CircleBorder(),
    //   color: Colors.transparent,
    //   child: InkWell(
    //     customBorder: CircleBorder(),
    //     //borderRadius: BorderRadius.circular(70.0),
    //     //splashColor: Colors.green,
    //     onTap: onPressed,
    //     child: Ink(
    //       height: 50.h,
    //       width: 50.w,
    //       decoration: BoxDecoration(
    //         shape: BoxShape.circle,
    //         color: ColorsManager.socialGray,
    //       ),
    //       padding: EdgeInsets.all(10),

    //       child: Image.asset(imageIcon, height: 24.h, width: 24.w),
    //     ),
    //   ),
    // );
  }
}

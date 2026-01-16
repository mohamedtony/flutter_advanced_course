import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/core/theming/colors.dart';
import 'package:flutter_advanced_course/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextformField extends StatelessWidget {
  final EdgeInsets? contentPadding;
  final OutlineInputBorder? focusedBorder;
  final OutlineInputBorder? enabledBorder;
  final TextStyle? hintStyle;
  final String? hintText;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextStyle? textStyle;

  const AppTextformField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.hintStyle,
    required this.hintText,
    this.suffixIcon,
    this.obscureText,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              //borderRadius: BorderRadius.circular(8.r),
              borderRadius: BorderRadius.all(Radius.circular(16.r)),
              borderSide: const BorderSide(
                color: ColorsManager.mainBlue,
                width: 1.3,
              ),
            ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.r)),
              borderSide: const BorderSide(
                color: ColorsManager.lightergray,
                width: 1.3,
              ),
            ),
        hintStyle: hintStyle ?? TextStyles.font14LightGrayRegular,
        hintText: hintText ?? " ",
        suffixIcon: suffixIcon,
        fillColor: Colors.white,
        filled: true,
      ),
      obscureText: obscureText ?? false,
      style: textStyle ?? TextStyles.font14DarkBlueMedium,
    );
  }
}

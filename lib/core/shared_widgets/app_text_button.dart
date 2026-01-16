import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/core/helpers/extensions.dart';
import 'package:flutter_advanced_course/core/routing/routes.dart';
import 'package:flutter_advanced_course/core/theming/colors.dart';
import 'package:flutter_advanced_course/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  final double? borderRaduis;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final VoidCallback onButtonClicked;
  final String text;
  final TextStyle? textStyle;
  final double? vericalPadding;
  final double? horizontalPadding;
  final double? buttonHieght;
  final double? buttonWidth;

  const AppTextButton({
    super.key,
    this.borderRaduis,
    this.backgroundColor,
    this.foregroundColor,
    required this.onButtonClicked,
    required this.text,
    this.textStyle,
    this.vericalPadding,
    this.horizontalPadding,
    this.buttonHieght,
    this.buttonWidth,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onButtonClicked,

      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          backgroundColor ?? ColorsManager.mainBlue,
        ),
        //foregroundColor: MaterialStateProperty.all(Colors.white),
        foregroundColor: WidgetStatePropertyAll(
          foregroundColor ?? Colors.white,
        ),
        //tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: WidgetStatePropertyAll<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRaduis ?? 16),
          ),
        ),
        //   minimumSize: WidgetStateProperty.all(const Size(double.infinity, 52)),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(
            vertical: vericalPadding ?? 12.h,
            horizontal: horizontalPadding ?? 12.w,
          ),
        ),

        fixedSize: WidgetStatePropertyAll<Size>(
          Size(buttonWidth?.w ?? double.maxFinite, buttonHieght?.h ?? 52.h),
        ),
      ),

      child: Text(text, style: textStyle ?? TextStyles.font16WhiteSemiBold),
    );
  }
}

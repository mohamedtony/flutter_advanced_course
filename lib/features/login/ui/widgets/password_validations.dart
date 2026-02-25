import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/core/theming/colors.dart';
import 'package:flutter_advanced_course/core/theming/styles.dart';

class PasswordValidations extends StatefulWidget {
  bool hasUppercase;
  bool hasLowercase;
  bool hasNumber;
  bool hasSpecailCharacters;
  bool hasMinLenght;
  PasswordValidations({
    super.key,
    required this.hasUppercase,
    required this.hasLowercase,
    required this.hasNumber,
    required this.hasSpecailCharacters,
    required this.hasMinLenght,
  });

  @override
  State<PasswordValidations> createState() => _PasswordValidationsState();
}

class _PasswordValidationsState extends State<PasswordValidations> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow("At least one uppercase letter", widget.hasUppercase),
        buildValidationRow("At least one lowercase letter", widget.hasLowercase),
        buildValidationRow("At least one number", widget.hasNumber),
        buildValidationRow("At least one 8 letters", widget.hasMinLenght),
        buildValidationRow(
          "At least one specail characters",
          widget.hasSpecailCharacters,
        ),
      ],
    );
  }

  Widget buildValidationRow(String s, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(radius: 5, backgroundColor: Colors.grey),
        const SizedBox(width: 5),
        Text(
          s,
          style: TextStyles.font12GrayRegular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: hasValidated ? ColorsManager.gray : ColorsManager.darkBlue,
          ),
        ),
      ],
    );
  }
}

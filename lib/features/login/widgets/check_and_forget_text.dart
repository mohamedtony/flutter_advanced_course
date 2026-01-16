import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/core/theming/colors.dart';
import 'package:flutter_advanced_course/core/theming/styles.dart';

class CheckAndForgetText extends StatelessWidget {
  final bool isChecked;
  void Function(bool?) onCheckedCheanged;
  CheckAndForgetText({
    super.key,
    required this.isChecked,
    required this.onCheckedCheanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Checkbox(
          value: isChecked,
          checkColor: Colors.white,
          //fillColor: WidgetStatePropertyAll(ColorsManager.mainBlue),
          activeColor: ColorsManager.mainBlue,
          onChanged: (value) {
            onCheckedCheanged(value);
          },
        ),
        InkWell(
          onTap: () {
            onCheckedCheanged(!isChecked);
          },
          child: Text("Remeber me", style: TextStyles.font12GrayRegular),
        ),
        //Spacer(), or
        Expanded(child: SizedBox()),
        Text("Forget Password!", style: TextStyles.font14BlueRegular),
      ],
    );
  }
}

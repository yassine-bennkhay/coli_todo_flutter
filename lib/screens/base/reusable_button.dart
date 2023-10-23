import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class ReusableButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  const ReusableButton(
      {super.key, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.kPrimaryColor,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          child: child),
    );
  }
}

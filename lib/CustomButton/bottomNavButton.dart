import 'package:flutter/material.dart';
import 'package:education_app/constants/app_constant.dart';

class AppButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final Color? color;
  final Color? textColor;
  final double height;
  final double width;
  final double radius;
  final bool isDisabled;

  const AppButton({
    super.key,
    required this.title,
    required this.onTap,
    this.color,
    this.textColor,
    this.height = 48,
    this.width = double.infinity,
    this.radius = 8,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: isDisabled ? null : onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: isDisabled
              ? AppColors.primary.withOpacity(0.4)
              : color ?? AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          foregroundColor: textColor ?? Colors.white,
        ),
        child: Text(title, style: TextStyle(
          color: textColor??Colors.white,fontWeight: FontWeight.bold,fontSize: 15
        )),
      ),
    );
  }
}

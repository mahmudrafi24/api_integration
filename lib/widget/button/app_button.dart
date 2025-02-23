import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loginsignup/widget/texts/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.height = 48,
    this.width = double.maxFinite,
    required this.onTap,
    this.title = "",
    this.borderSideColors, // Made nullable
    this.marginVerticel = 0,
    this.marginHorizontal = 0,
    required this.fillColor,
    required this.textColor,
    this.fontSize,
  });

  final double height;
  final double width;
  final Color fillColor;
  final Color textColor;
  final Color? borderSideColors; // Nullable
  final VoidCallback onTap;
  final String title;
  final double marginVerticel;
  final double marginHorizontal;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: marginVerticel,
          horizontal: marginHorizontal,
        ),
        alignment: Alignment.center,
        height: height.h,
        width: width.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: fillColor,
          border: borderSideColors != null
              ? Border.all(
                  color: borderSideColors!,
                  width: 1.0,
                )
              : null, // No border if borderSideColors is null
        ),
        child: CustomText(
          fontWeight: FontWeight.w600,
          color: textColor,
          textAlign: TextAlign.center,
          fontSize: 13.sp?? fontSize,
          text: title,
        ),
      ),
    );
  }
}
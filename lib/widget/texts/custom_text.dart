import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    this.maxLines,
    this.textAlign = TextAlign.center,
    this.left = 0,
    this.right = 0,
    this.top = 0,
    this.bottom = 0,
    this.fontSize,
    this.fontWeight = FontWeight.w400,
    this.color = Colors.black,
    required this.text,
    this.overflow = TextOverflow.ellipsis,
    this.decoration,
    this.fontFamily = 1,
    this.isTranslate = true, // Default is Poppins
  });

  final bool isTranslate;
  final double left;
  final double right;
  final double top;
  final double bottom;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final String text;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow overflow;
  final TextDecoration? decoration;
  final int fontFamily; // 1 for Poppins, 2 for Roboto

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
      child: Text(
        isTranslate ? text.tr : text,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        style: (fontFamily == 1 ? GoogleFonts.poppins() : GoogleFonts.roboto())
            .copyWith(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          decoration: decoration,
        ),
      ),
    );
  }
}
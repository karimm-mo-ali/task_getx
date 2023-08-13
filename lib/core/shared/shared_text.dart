import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/strings.dart';

class SharedText extends StatelessWidget {
  final String title;
  final Color titleColor;
  final double textTitleSize;
  final FontWeight fontWeight;
  final String fontFamily;
  final TextAlign textAlign;
  const SharedText({
    Key? key,
    required this.title,
    this.textTitleSize = 30,
    this.titleColor = kPrimaryColor,
    this.fontWeight = FontWeight.w700,
    this.fontFamily = appFontFamily,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: textTitleSize,
        color: titleColor,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
      ),
    );
  }
}

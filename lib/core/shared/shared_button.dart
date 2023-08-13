import 'package:flutter/material.dart';
import 'package:start_tech_task/core/helpers/helper_methods.dart';
import '../constants/colors.dart';
import '../constants/strings.dart';
import 'shared_text.dart';

class SharedButton extends StatelessWidget {
  const SharedButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.color = kPrimaryColor,
    this.radius = 13.0,
    this.titleColor = kWhiteColor,
    this.textTitleSize = 25.0,
    this.fontWeight = FontWeight.w800,
    this.fontFamily = appFontFamily,
    this.withBorder = false,
  }) : super(key: key);

  final Function() onPressed;
  final Color color;
  final double radius;
  final String title;
  final Color titleColor;
  final double textTitleSize;
  final FontWeight fontWeight;
  final String fontFamily;
  final bool withBorder;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: setHeight(context, 0.065),
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: withBorder ? titleColor : color,
          borderRadius: BorderRadius.circular(radius),
          border: withBorder ? Border.all(color: color, width: 1.5) : null,
        ),
        child: SharedText(
          title: title,
          titleColor: !withBorder ? titleColor : color,
          textTitleSize: textTitleSize,
          fontWeight: fontWeight,
          fontFamily: fontFamily,
        ),
      ),
    );
  }
}

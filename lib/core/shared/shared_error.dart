import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'shared_text.dart';


SnackBar displaySnackBar(String content, bool success) {
  return SnackBar(
    elevation: 0.0,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
    behavior: SnackBarBehavior.floating,
    backgroundColor: kSnackBarColor,
    padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),

    content: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SharedText(
          title: success ? "Success" : "Failed",
          textTitleSize: 25,
          titleColor: kWhiteColor,
        ),
        const SizedBox(height: 8),
        SharedText(
          title: content,
          textTitleSize: 22,
          titleColor: kWhiteColor,
          fontWeight: FontWeight.w500,
        ),
      ],
    ),
  );
}

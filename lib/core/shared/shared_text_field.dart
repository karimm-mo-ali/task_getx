import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:queen_validators/queen_validators.dart';
import '../constants/colors.dart';
import '../constants/strings.dart';

class SharedTextField extends StatelessWidget {
  const SharedTextField(
      {Key? key,
      this.hintText,
      this.focusNode,
      this.onSaved,
      this.validator,
      this.onFieldSubmitted,
      this.onChange,
      this.textInputAction,
      this.keyboardType,
      this.controller,
      this.isObscure = false,
      this.decoration,
      this.readOnly = false,
      this.enabled = true,
      this.autoValidateMode = AutovalidateMode.onUserInteraction,
      this.onEditingComplete,
      this.maxLines,
      this.onTap,
      this.style = const TextStyle(
        color: kPrimaryColor,
        fontSize: 20,
        fontFamily: appFontFamily,
        fontWeight: FontWeight.w700,
      ),
      this.textAlign = TextAlign.center,
      this.inputFormatters,
      this.suffixIcon,this.prefixIcon})
      : super(key: key);

  final String? hintText;
  final FocusNode? focusNode;
  final int? maxLines;
  final bool isObscure;
  final bool readOnly;
  final bool enabled;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? style;
  final TextAlign textAlign;
  final AutovalidateMode autoValidateMode;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final InputDecoration? decoration;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChange;
  final void Function()? onEditingComplete;
  final VoidCallback? onTap;
  final List<TextInputFormatter>? inputFormatters;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: style,
      textAlign: textAlign,
      focusNode: focusNode,
      controller: controller,
      enabled: enabled,
      inputFormatters: inputFormatters ?? [],
      keyboardType: keyboardType,
      maxLines: maxLines ?? 1,
      textInputAction: textInputAction,
      obscureText: isObscure,
      decoration: decoration ??
          InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13.0),
              borderSide: const BorderSide(color: kBorderColor, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13.0),
              borderSide: const BorderSide(color: kBorderColor, width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13.0),
              borderSide: const BorderSide(color: kBorderColor, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13.0),
              borderSide: const BorderSide(color: kBorderColor, width: 1.5),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 20),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: kBorderColor,
              fontSize: 20,
              fontFamily: appFontFamily,
              fontWeight: FontWeight.w700,
            ),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
          ),
      onChanged: onChange,
      onSaved: onSaved,
      validator: validator ??
          qValidator([
            IsRequired("Required"),
          ]),
      onTap: onTap,
      readOnly: readOnly,
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
      autovalidateMode: autoValidateMode,
    );
  }
}

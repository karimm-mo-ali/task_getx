library register;

import 'dart:convert';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:queen_validators/queen_validators.dart';
import '../../../core/config/app_pages.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../../core/helpers/helper_methods.dart';
import '../../../core/shared/hide_keyboard.dart';
import '../../../core/shared/shared_button.dart';
import '../../../core/shared/shared_error.dart';
import '../../../core/shared/shared_text.dart';
import '../../../core/shared/shared_text_field.dart';
import '../../../core/utils/shared_preferences.dart';

part '../binding/register_binding.dart';
part '../controllers/register_controller.dart';
part '../models/register.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Obx(() => HideKeyboard(
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: setWidth(context, 0.13)),
                child: SingleChildScrollView(
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: setHeight(context, 0.03),
                            bottom: setHeight(context, 0.03),
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/images/ali_fouad_logo.png",
                              fit: BoxFit.fitHeight,
                              width: setWidth(context, 0.35),
                              height: setHeight(context, 0.18),
                            ),
                          ),
                        ),
                        const SharedText(title: "Register"),
                        SizedBox(height: setHeight(context, 0.05)),
                        SharedTextField(
                          hintText: "Full Name",
                          controller: controller.fullNameController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                        ),
                        SizedBox(height: setHeight(context, 0.025)),
                        SharedTextField(
                          hintText: "Mobile Number",
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(9),
                          ],
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: CountryFlag.fromCountryCode(
                              'AE',
                              height: 0,
                              width: 35,
                            ),
                          ),
                          controller: controller.mobileController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.phone,
                        ),
                        SizedBox(height: setHeight(context, 0.025)),
                        SharedTextField(
                          hintText: "Email Address",
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp(r' ')),
                          ],
                          validator: qValidator([
                            IsRequired(),
                            const IsEmail("Invalid Email Address"),
                          ]),
                          controller: controller.emailController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: setHeight(context, 0.025)),
                        SharedTextField(
                          isObscure: controller.isPasswordObscure.value,
                          hintText: "Password",
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp(r' ')),
                          ],
                          suffixIcon: InkWell(
                            onTap: controller.togglePassword,
                            child: Icon(
                                controller.isPasswordObscure.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                size: 25),
                          ),
                          controller: controller.passwordController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        SizedBox(height: setHeight(context, 0.025)),
                        SharedTextField(
                          isObscure: controller.isConfirmPasswordObscure.value,
                          hintText: "Confirm Password",
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp(r' ')),
                          ],
                          suffixIcon: InkWell(
                            onTap: controller.toggleConfirmPassword,
                            child: Icon(
                                controller.isConfirmPasswordObscure.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                size: 25),
                          ),
                          validator: controller.validatePassword,
                          controller: controller.confirmPasswordController,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        SizedBox(height: setHeight(context, 0.05)),
                        SharedButton(
                          title: "Register",
                          onPressed: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            if (controller.formKey.currentState!.validate()) {
                              controller.register();
                            }
                          },
                        ),
                        SizedBox(height: setHeight(context, 0.03)),
                        Text.rich(
                          TextSpan(
                            text: "Already have an account? ",
                            style: kDesVevStyle,
                            children: [
                              TextSpan(
                                text: "Login",
                                style: kDesVevStyle.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Get.toNamed(Routes.login),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: setHeight(context, 0.05)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}

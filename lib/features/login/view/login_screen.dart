library login;

import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:queen_validators/queen_validators.dart';
import 'package:http/http.dart' as http;
import 'package:start_tech_task/core/shared/shared_error.dart';
import '../../../core/config/app_pages.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../../core/helpers/helper_methods.dart';
import '../../../core/shared/hide_keyboard.dart';
import '../../../core/shared/shared_button.dart';
import '../../../core/shared/shared_text.dart';
import '../../../core/shared/shared_text_field.dart';
import '../../../core/utils/shared_preferences.dart';

part '../binding/login_binding.dart';
part '../controllers/login_controller.dart';
part '../models/login.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Obx(() => HideKeyboard(
            child: SafeArea(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: setWidth(context, 0.13)),
                child: Form(
                  key: controller._formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: setHeight(context, 0.06),
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
                      const SharedText(title: "Login"),
                      const Spacer(),
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
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      SizedBox(height: setHeight(context, 0.05)),
                      SharedButton(
                        title: "Login",
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          if (controller._formKey.currentState!.validate()) {
                            controller.login();
                          }
                        },
                      ),
                      const Spacer(),
                      Text.rich(
                        TextSpan(
                          text: "Don't have an account? ",
                          style: kDesVevStyle,
                          children: [
                            TextSpan(
                              text: "Register",
                              style: kDesVevStyle.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.toNamed(Routes.register),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: setHeight(context, 0.02)),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}

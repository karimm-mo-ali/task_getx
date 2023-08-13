library change_password;

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:start_tech_task/core/constants/colors.dart';
import '../../../core/helpers/helper_methods.dart';
import '../../../core/shared/hide_keyboard.dart';
import '../../../core/shared/shared_appbar.dart';
import '../../../core/shared/shared_button.dart';
import '../../../core/shared/shared_error.dart';
import '../../../core/shared/shared_text_field.dart';
import '../../../core/utils/shared_preferences.dart';

part '../binding/change_password_binding.dart';
part '../controllers/change_password_controller.dart';
part '../models/change_password.dart';

class ChangePasswordScreen extends GetView<ChangePasswordController> {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const SharedAppBar(title: "Change Password"),
      body: Obx(() => HideKeyboard(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: setWidth(context, 0.13)),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    SizedBox(height: setHeight(context, 0.05)),
                    SharedTextField(
                      isObscure: controller.isCurrentPasswordObscure.value,
                      hintText: "Current Password",
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r' ')),
                      ],
                      suffixIcon: InkWell(
                        onTap: controller.toggleCurrentPassword,
                        child: Icon(
                            controller.isCurrentPasswordObscure.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 25),
                      ),
                      controller: controller.currentPasswordController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    SizedBox(height: setHeight(context, 0.025)),
                    SharedTextField(
                      isObscure: controller.isNewPasswordObscure.value,
                      hintText: "New Password",
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r' ')),
                      ],
                      suffixIcon: InkWell(
                        onTap: controller.toggleNewPassword,
                        child: Icon(
                            controller.isNewPasswordObscure.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 25),
                      ),
                      controller: controller.newPasswordController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    SizedBox(height: setHeight(context, 0.025)),
                    SharedTextField(
                      isObscure: controller.isConfirmNewPasswordObscure.value,
                      hintText: "Confirm Password",
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r' ')),
                      ],
                      suffixIcon: InkWell(
                        onTap: controller.toggleConfirmNewPassword,
                        child: Icon(
                            controller.isConfirmNewPasswordObscure.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 25),
                      ),
                      validator: controller.validatePassword,
                      controller: controller.confirmNewPasswordController,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    SizedBox(height: setHeight(context, 0.025)),
                    SharedButton(
                      title: "Save",
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        if (controller.formKey.currentState!.validate()) {
                          controller.changePassword();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

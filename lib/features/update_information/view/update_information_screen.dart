library update_information;

import 'dart:convert';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:queen_validators/queen_validators.dart';
import '../../../core/helpers/helper_methods.dart';
import '../../../core/shared/hide_keyboard.dart';
import '../../../core/shared/shared_appbar.dart';
import '../../../core/shared/shared_button.dart';
import '../../../core/shared/shared_error.dart';
import '../../../core/shared/shared_text_field.dart';
import '../../../core/utils/shared_preferences.dart';
import '../../home/view/home_screen.dart';

part '../binding/update_information_binding.dart';
part '../controllers/update_information_controller.dart';
part '../models/update_information.dart';

class UpdateInformationScreen extends GetView<UpdateInformationController> {
  const UpdateInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const SharedAppBar(title: "Update Information"),
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
                      hintText: "Full Name",
                      controller: controller.fullNameController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(height: setHeight(context, 0.025)),
                    // IntlPhoneField(
                    //   controller: controller.mobileController,
                    //   autovalidateMode: AutovalidateMode.onUserInteraction,
                    //   flagsButtonMargin: const EdgeInsets.only(left: 5),
                    //   showDropdownIcon: false,
                    //   flagsButtonPadding: EdgeInsets.zero,
                    //   textInputAction: TextInputAction.next,
                    //   keyboardType: TextInputType.phone,
                    //   inputFormatters: [
                    //     FilteringTextInputFormatter.digitsOnly,
                    //   ],
                    //   decoration: InputDecoration(
                    //     hintText: "Mobile Number",
                    //     counter: const SizedBox(),
                    //     hintStyle: const TextStyle(
                    //       color: kBorderColor,
                    //       fontSize: 20,
                    //       fontFamily: appFontFamily,
                    //       fontWeight: FontWeight.w700,
                    //     ),
                    //     enabledBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(13.0),
                    //       borderSide: const BorderSide(color: kBorderColor, width: 1.5),
                    //     ),
                    //     focusedBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(13.0),
                    //       borderSide: const BorderSide(color: kBorderColor, width: 1.5),
                    //     ),
                    //     focusedErrorBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(13.0),
                    //       borderSide: const BorderSide(color: kBorderColor, width: 1.5),
                    //     ),
                    //     errorBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(13.0),
                    //       borderSide: const BorderSide(color: kBorderColor, width: 1.5),
                    //     ),
                    //     contentPadding: const EdgeInsets.symmetric(vertical: 20),
                    //   ),
                    //   initialCountryCode: 'AE',
                    // ),
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
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: setHeight(context, 0.025)),
                    SharedButton(
                      title: "Save",
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        if (controller.formKey.currentState!.validate()) {
                          controller.updateUser();
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

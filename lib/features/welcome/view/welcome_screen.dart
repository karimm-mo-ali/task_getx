import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:start_tech_task/core/helpers/helper_methods.dart';
import 'package:start_tech_task/core/shared/shared_button.dart';
import 'package:start_tech_task/core/shared/shared_text.dart';
import '../../../core/config/app_pages.dart';
import '../../../core/constants/styles.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: setWidth(context, 0.13)),
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
                    fit: BoxFit.cover,
                    width: setWidth(context, 0.35),
                    height: setHeight(context, 0.18),
                  ),
                ),
              ),
              const SharedText(title: "Welcome to the app"),
              const Spacer(),
              SharedButton(
                title: "Login",
                onPressed: () => Get.toNamed(Routes.login),
              ),
              SizedBox(height: setHeight(context, 0.02)),
              SharedButton(
                title: "Register",
                onPressed: () => Get.toNamed(Routes.register),
                withBorder: true,
              ),
              const Spacer(),
              Text.rich(
                TextSpan(
                  text: "Designed & Developed by ",
                  style: kDesVevStyle,
                  children: [
                    TextSpan(
                      text: "Ali Fouad",
                      style: kDesVevStyle.copyWith(
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: setHeight(context, 0.02)),
            ],
          ),
        ),
      ),
    );
  }
}

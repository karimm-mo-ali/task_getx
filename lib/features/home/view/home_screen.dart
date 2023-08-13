library home;

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../core/config/app_pages.dart';
import '../../../core/constants/colors.dart';
import '../../../core/shared/shared_appbar.dart';
import '../../../core/shared/shared_dialogs.dart';
import '../../../core/shared/shared_error.dart';
import '../../../core/shared/shared_text.dart';
import '../../../core/utils/shared_preferences.dart';
part '../binding/home_binding.dart';
part '../controllers/home_controller.dart';
part '../models/user.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: const SharedAppBar(title: "Home Page", leading: false),
      body: Obx(() => Column(
            children: [
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(
                  Icons.person_outlined,
                  color: kPrimaryColor,
                  size: 25,
                ),
                title: SharedText(
                    title: controller.fullName.value,
                    titleColor: kBorderColor,
                    textTitleSize: 20),
              ),
              ListTile(
                leading: const Icon(
                  Icons.phone_android,
                  color: kPrimaryColor,
                  size: 25,
                ),
                title: SharedText(
                    title: controller.mobile.value,
                    titleColor: kBorderColor,
                    textTitleSize: 20),
              ),
              ListTile(
                leading: const Icon(
                  Icons.mail_outline,
                  color: kPrimaryColor,
                  size: 25,
                ),
                title: SharedText(
                    title: controller.email.value,
                    titleColor: kBorderColor,
                    textTitleSize: 20),
              ),
              InkWell(
                onTap: () => Get.toNamed(Routes.updateInformation),
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                      right: 10, left: 10, bottom: 5, top: 20),
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: kShadColor,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 4.0,
                      ),
                    ],
                  ),
                  child: const ListTile(
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: kPrimaryColor,
                      size: 25,
                    ),
                    title: SharedText(
                        title: "Update Information", textTitleSize: 20),
                  ),
                ),
              ),
              InkWell(
                onTap: () => Get.toNamed(Routes.changePassword),
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(right: 10, left: 10, bottom: 5),
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: kShadColor,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 4.0,
                      ),
                    ],
                  ),
                  child: const ListTile(
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: kPrimaryColor,
                      size: 25,
                    ),
                    title:
                        SharedText(title: "Change Password", textTitleSize: 20),
                  ),
                ),
              ),
              InkWell(
                onTap: () => showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (context) {
                    return DeleteAccountDialog(
                      onTap: () => controller.deleteUser(),
                    );
                  },
                ),
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(right: 10, left: 10, bottom: 5),
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: kShadColor,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 4.0,
                      ),
                    ],
                  ),
                  child: const ListTile(
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: kPrimaryColor,
                      size: 25,
                    ),
                    title:
                        SharedText(title: "Delete Account", textTitleSize: 20),
                  ),
                ),
              ),
              InkWell(
                onTap: () => showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (context) {
                    return LogoutDialog(
                      onTap: () => controller.logout(),
                    );
                  },
                ),
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(right: 10, left: 10, bottom: 5),
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: kShadColor,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 4.0,
                      ),
                    ],
                  ),
                  child: const ListTile(
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: kPrimaryColor,
                      size: 25,
                    ),
                    title: SharedText(title: "Logout", textTitleSize: 20),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

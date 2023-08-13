import 'package:flutter/material.dart';
import 'package:start_tech_task/core/helpers/helper_methods.dart';
import 'package:start_tech_task/core/shared/shared_text.dart';
import '../constants/colors.dart';

class LogoutDialog extends StatelessWidget {
  final Function() onTap;
  const LogoutDialog({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(36)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 260,
        padding: EdgeInsets.symmetric(horizontal: setWidth(context, 0.077)),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(36.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SharedText(
              title: "Are you sure you want to\nlogout?",
              textTitleSize: 22,
              textAlign: TextAlign.center,
              titleColor: kPrimaryColor,
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Expanded(
                  flex: 6,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: const <BoxShadow>[
                          BoxShadow(
                            color: kShadColor,
                            offset: Offset(0.0, 4.0),
                            blurRadius: 4.0,
                          ),
                        ],
                      ),
                      child: const SharedText(
                        title: "Cancel",
                        textTitleSize: 20,
                        titleColor: kPrimaryColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 6,
                  child: InkWell(
                    onTap: onTap,
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: const <BoxShadow>[
                          BoxShadow(
                            color: kShadColor,
                            offset: Offset(0.0, 4.0),
                            blurRadius: 4.0,
                          ),
                        ],
                      ),
                      child: const SharedText(
                        title: "Logout",
                        textTitleSize: 20,
                        titleColor: kWhiteColor,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DeleteAccountDialog extends StatelessWidget {
  final Function() onTap;
  const DeleteAccountDialog({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(36)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 260,
        padding: EdgeInsets.symmetric(horizontal: setWidth(context, 0.077)),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(36.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SharedText(
              title:  "Are you sure you want to\ndelete account?",
              textAlign: TextAlign.center,
              textTitleSize: 22,
              titleColor: kPrimaryColor,
            ),
            const SizedBox(height: 12),
            const SharedText(
              title:
                  "This action will delete all your data from our systems and you won’t be able to retrieve them",
              textTitleSize: 20,
              fontWeight: FontWeight.w400,
              titleColor: kPrimaryColor,
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Expanded(
                  flex: 6,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: const <BoxShadow>[
                          BoxShadow(
                            color: kShadColor,
                            offset: Offset(0.0, 4.0),
                            blurRadius: 4.0,
                          ),
                        ],
                      ),
                      child: const SharedText(
                        title: "Cancel",
                        textTitleSize: 20,
                        titleColor: kPrimaryColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 6,
                  child: InkWell(
                    onTap:onTap,
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: const <BoxShadow>[
                          BoxShadow(
                            color: kShadColor,
                            offset: Offset(0.0, 4.0),
                            blurRadius: 4.0,
                          ),
                        ],
                      ),
                      child: const SharedText(
                        title: "Delete",
                        textTitleSize: 20,
                        titleColor: kWhiteColor,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

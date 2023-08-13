import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'shared_text.dart';

class SharedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool? leading;
  const SharedAppBar({Key? key, this.title, this.leading = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: kPrimaryColor,
      title: SharedText(
        title: title!,
        titleColor: kWhiteColor,
        textTitleSize: 25,
      ),
      centerTitle: true,
      leading: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: leading == true
              ? InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back_ios, color: kWhiteColor),
                )
              : const SizedBox()),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

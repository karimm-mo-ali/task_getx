import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/config/app_pages.dart';
import 'core/constants/strings.dart';
import 'core/utils/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs().init();
  runApp(const Task());
}

class Task extends StatefulWidget {
  const Task({Key? key}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {

  @override
  void initState() {
    if (kDebugMode) {
      print("Signed in ? ${sharedPrefs.getSignedIn()}");
      print("token is ? ${sharedPrefs.token}");
    }
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appName,
      debugShowCheckedModeBanner: true,
      initialRoute: SharedPrefs().token != "" && SharedPrefs().getSignedIn()
          ? AppPages.home
          : AppPages.welcome,
      getPages: AppPages.routes,
    );
  }
}

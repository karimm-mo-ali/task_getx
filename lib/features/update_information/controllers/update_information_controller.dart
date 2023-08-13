part of update_information;

class UpdateInformationController extends GetxController {
  final homeController = Get.find<HomeController>();

  final formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void onInit() {
    fullNameController.text = homeController.fullName.value;
    mobileController.text = homeController.mobile.value;
    emailController.text = homeController.email.value;
    super.onInit();
  }

  Future<UpdateUserModel?> updateUser() async {
    const url = 'http://testapi.alifouad91.com/api/user/update';

    final response = await http.post(Uri.parse(url), body: {
      'name': fullNameController.text,
      'email': emailController.text,
      'phone': mobileController.text,
    }, headers: {
      "Authorization": sharedPrefs.token!,
    });

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        displaySnackBar(responseData["message"], responseData["success"]),
      );
      homeController.fullName.value = responseData["data"]['name'];
      homeController.mobile.value = responseData["data"]['phone'];
      homeController.email.value = responseData["data"]['email'];
      update();
      Get.back();
    } else {
      final responseData = json.decode(response.body);
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        displaySnackBar(responseData["message"], responseData["success"]),
      );
    }
    return null;
  }
}

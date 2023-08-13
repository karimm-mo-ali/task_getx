part of change_password;

class ChangePasswordController extends GetxController {
  late RxBool isCurrentPasswordObscure;
  late RxBool isNewPasswordObscure;
  late RxBool isConfirmNewPasswordObscure;

  final formKey = GlobalKey<FormState>();

  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    isCurrentPasswordObscure = true.obs;
    isNewPasswordObscure = true.obs;
    isConfirmNewPasswordObscure = true.obs;
  }

  toggleCurrentPassword() {
    isCurrentPasswordObscure.value = !isCurrentPasswordObscure.value;
    update();
  }

  toggleNewPassword() {
    isNewPasswordObscure.value = !isNewPasswordObscure.value;
    update();
  }

  toggleConfirmNewPassword() {
    isConfirmNewPasswordObscure.value = !isConfirmNewPasswordObscure.value;
    update();
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Required';
    }
    if (newPasswordController.text != confirmNewPasswordController.text) {
      return 'Passwords don\'t match';
    }
    return null;
  }

  Future<ChangePasswordModel?> changePassword() async {
    const url = 'http://testapi.alifouad91.com/api/user/changepassword';

    final response = await http.post(Uri.parse(url), body: {
      'password': newPasswordController.text,
      'password_confirm': confirmNewPasswordController.text,
      'current_password': currentPasswordController.text,
    }, headers: {
      "Authorization": sharedPrefs.token!,
    });

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        displaySnackBar(responseData, responseData["success"]),
      );
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

part of register;

class RegisterController extends GetxController {
  late RxBool isPasswordObscure ;
  late RxBool isConfirmPasswordObscure ;

  final formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();


  @override
  void onInit() {
    super.onInit();
    isPasswordObscure = true.obs;
    isConfirmPasswordObscure = true.obs;
  }

  togglePassword() {
    isPasswordObscure.value = !isPasswordObscure.value;
    update();
  }

  toggleConfirmPassword() {
    isConfirmPasswordObscure.value = !isConfirmPasswordObscure.value;
    update();
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Required';
    }
    if (passwordController.text != confirmPasswordController.text) {
      return 'Passwords don\'t match';
    }
    return null;
  }

  Future<RegisterModel?> register() async {
    const url = 'http://testapi.alifouad91.com/api/user/register';

    final response = await http.post(
      Uri.parse(url),
      body: {
        'name': fullNameController.text,
        'email': emailController.text,
        'phone': mobileController.text,
        'password': passwordController.text,
        'country_code': "+971",
        'password_confirm': confirmPasswordController.text,
      },
    );

    if (response.statusCode == 201) {
      final responseData = json.decode(response.body);
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        displaySnackBar(responseData["message"], responseData["success"]),
      );
      sharedPrefs.setDevToken(responseData["data"]["token"]);
      sharedPrefs.setUserId(responseData["data"]["id"]);
      Get.toNamed(Routes.home);
    } else {
      final responseData = json.decode(response.body);
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        displaySnackBar(responseData["message"], responseData["success"]),
      );
    }
    return null;
  }
}

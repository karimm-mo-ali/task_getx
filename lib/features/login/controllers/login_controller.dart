part of login;

class LoginController extends GetxController {
  late RxBool isPasswordObscure;

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    isPasswordObscure = true.obs;
  }

  togglePassword() {
    isPasswordObscure.value = !isPasswordObscure.value;
    update();
  }

  Future<LoginModel?> login() async {
    const url = 'http://testapi.alifouad91.com/api/login';

    final response = await http.post(
      Uri.parse(url),
      body: {
        'email': emailController.text,
        'password': passwordController.text,
      },
    );
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      sharedPrefs.setSignedIn(true);
      sharedPrefs.setToken(responseData["data"]["token"]);
      sharedPrefs.setUserId(responseData["data"]["id"]);
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        displaySnackBar(responseData["message"], responseData["success"]),
      );
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

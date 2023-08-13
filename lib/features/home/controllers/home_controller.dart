part of home;

class HomeController extends GetxController {
  late RxString fullName;
  late RxString mobile;
  late RxString email;

  @override
  void onInit() {
    super.onInit();
    fullName = "".obs;
    mobile = "".obs;
    email = "".obs;
    getUser(int.parse(sharedPrefs.userId!));
  }

  Future<UserModel?> getUser(int userId) async {
    final response = await http.get(
        Uri.parse('http://testapi.alifouad91.com/api/user/$userId'),
        headers: {
          "Authorization": sharedPrefs.token!,
        });
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      fullName.value = responseData["data"]['name'];
      mobile.value = responseData["data"]['phone'];
      email.value = responseData["data"]['email'];
      update();
    } else {
      final responseData = json.decode(response.body);
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        displaySnackBar(responseData["message"], responseData["success"]),
      );
    }
    return null;
  }

  Future<DeleteUserModel?> deleteUser() async {
    const url = 'http://testapi.alifouad91.com/api/user/delete';

    final response = await http.delete(Uri.parse(url), headers: {
      "Authorization": sharedPrefs.token!,
      "Content-Type": "application/json",
      "Accept": "application/json",
    });

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      sharedPrefs.setSignedIn(false);
      sharedPrefs.removeToken();
      sharedPrefs.removeDevToken();
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        displaySnackBar(responseData["message"], responseData["success"]),
      );
      Get.offNamed(Routes.login);
    } else {
      final responseData = json.decode(response.body);
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        displaySnackBar(responseData["message"], responseData["success"]),
      );
    }
    return null;
  }

  logout() {
    sharedPrefs.setSignedIn(false);
    sharedPrefs.removeToken();
    sharedPrefs.removeDevToken();
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      displaySnackBar("You have been successfully logged out.", true),
    );
    Get.offNamed(Routes.login);
  }
}

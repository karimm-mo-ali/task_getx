import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences? sharedPrefs;

  Future<void> init() async {
    sharedPrefs = await SharedPreferences.getInstance();
  }

  String? get token =>
      sharedPrefs?.getString(keyToken) ?? sharedPrefs?.getString(keyDevToken);

  String? get userId => sharedPrefs?.getString(keyUserId) ?? "";

  bool getSignedIn() {
    return sharedPrefs!.getBool(keySignedIn) ?? false;
  }

  setSignedIn(bool value) {
    sharedPrefs!.setBool(keySignedIn, value);
  }

  setUserId(String value) {
    sharedPrefs!.setString(keyUserId, value);
  }

  setToken(String value) {
    sharedPrefs!.setString(keyToken, value);
  }

  void removeToken() {
    sharedPrefs!.remove(keyToken);
  }

  setDevToken(String value) {
    sharedPrefs!.setString(keyDevToken, value);
  }

  void removeDevToken() {
    sharedPrefs!.remove(keyDevToken);
  }
}

final sharedPrefs = SharedPrefs();

String keySignedIn = "key_signedIn";
String keyToken = "key_token";
String keyDevToken = "key_dev_token";
String keyUserId = "key_user_id";

import 'dart:convert';

import 'package:get/get.dart';
import 'package:internet_app/models/user_model.dart';
import 'package:internet_app/screens/home_screen.dart';
import 'package:internet_app/services/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  RxBool isLoggedIn = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkAlreadyLogin();
  }

  Future<void> login(String email, String password) async {
    isLoggedIn.value = true;
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    LoginService service = LoginService();
    var response = await service.login(email, password);
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      var userModel = User.fromJson(jsonResponse);
      prefs.setBool("isLogedIn", true);
      var bearerToken = 'Bearer ${userModel.token}';
      prefs.setString("justToken", userModel.token.toString());
      prefs.setString("token", bearerToken);
      isLoggedIn.value = false;
      Get.to(() => const HomeScreen());
    } else {
      isLoggedIn.value = false;
    }
  }

  void checkAlreadyLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token") ?? "";
    if (token != "") {
      Get.off(const HomeScreen());
    }
  }
}

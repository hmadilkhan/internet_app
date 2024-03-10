import 'dart:convert';

import 'package:flutter/material.dart';
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
      prefs.setString("name", userModel.name.toString());
      prefs.setString("token", bearerToken);
      Get.to(() => const HomeScreen());
      isLoggedIn.value = false;
    } else {
      isLoggedIn.value = false;
      Get.snackbar(
        "Error",
        "Username or Password is incorrect.",
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white
      );
    }
  }

  void checkAlreadyLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token") ?? "";
    if (token != "") {
      Get.off(() => const HomeScreen());
    }
  }
}

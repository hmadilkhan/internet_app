import 'package:get/get.dart';
import 'package:internet_app/controllers/auth_controller.dart';

class MyBindings extends Bindings {
  
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
import 'dart:convert';

import 'package:get/get.dart';
import 'package:internet_app/models/area_model.dart';
import 'package:internet_app/models/customer_model.dart';
import 'package:internet_app/models/package_model.dart';
import 'package:internet_app/screens/customer_screen.dart';
import 'package:internet_app/services/customer_service.dart';

class CustomerController extends GetxController {
  final listProduct = <Customer>[].obs;
  final listAreas = <Area>[].obs;
  final listPackages = <Package>[].obs;

  @override
  void onInit() {
    super.onInit();
    allCustomers();
  }

  Future<void> allCustomers() async {
    CustomerService service = CustomerService();
    var response = await service.getCustomers();
    if (response.statusCode == 200) {
      final maps = json.decode(response.body);
      var results = List.generate(maps['data']['customers'].length,
          (index) => Customer.fromJson(maps?['data']['customers'][index]));
      listProduct.value = results;
      // Get.snackbar("Customer", "Fetched successfully");
    } else {
      Get.snackbar("Error", "Error in Fetched");
    }
  }

  Future getAreas() async {
    CustomerService service = CustomerService();
    var response = await service.getAreas();
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;
      // Get.snackbar("Error", "Some Error Occurred in fetching Areas");
    }
  }

  Future getPackages() async {
    CustomerService service = CustomerService();
    var response = await service.getPackages();
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;
      // Get.snackbar("Error", "Some Error Occurred in fetching Areas");
    }
  }


  Future updateCustomer(int id, String name, String username, String mobile,
      String amount, String area, String package, String address) async {
    CustomerService service = CustomerService();
    var response = await service.updateCustomers(
        id, name, username, mobile, amount, area, package, address);
    if (response.statusCode == 200) {
      Get.snackbar("Success", "Customer updated.");
      Get.off(() => const CustomerScreen());
      allCustomers();
    } else {
      // return null;
      Get.snackbar("Error", "Some Error Occurred in fetching Areas");
    }
  }
}

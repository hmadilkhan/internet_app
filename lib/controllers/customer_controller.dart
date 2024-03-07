import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:internet_app/models/customer_model.dart';
import 'package:internet_app/services/customer_service.dart';

class CustomerController extends GetxController {
  final listProduct = <Customer>[].obs;

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
      Get.snackbar("Customer", "Fetched successfully");
    } else {
      Get.snackbar("Customer", "Fetched successfully");
    }
  }
}

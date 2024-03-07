import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:internet_app/models/area_model.dart';
import 'package:internet_app/models/customer_model.dart';
import 'package:internet_app/models/package_model.dart';
import 'package:internet_app/services/customer_service.dart';

class CustomerController extends GetxController {
  final listProduct = <Customer>[].obs;
  final listAreas = <Area>[].obs;
  final listPackages = <Package>[].obs;

  @override
  void onInit() {
    super.onInit();
    allCustomers();
    // getAreas();
    // getPackages();
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

  Future getAreas() async {
    CustomerService service = CustomerService();
    var response = await service.getAreas();
    if (response.statusCode == 200) {
      return response.body;
      // products = parseProducts(response.body);
      // final maps = json.decode(response.body);
      // var results = List.generate(maps['data']['areas'].length,
      //     (index) => Area.fromJson(maps?['data']['areas'][index]));
      // listAreas.value = results;
      // print(response.body);
      // return parseProducts(response.body);
      // Get.snackbar("Customer", "Fetched successfully");
    } else {
      return null;
      // Get.snackbar("Error", "Some Error Occurred in fetching Areas");
    }
  }

  List<Area> parseProducts(String responseBody) {
    final parsed =
        (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();

    return parsed
        .map<Area>((json) => Area.fromJson(json))
        .toList();
  }

  Future<void> getPackages() async {
    CustomerService service = CustomerService();
    var response = await service.getPackages();
    if (response.statusCode == 200) {
      final maps = json.decode(response.body);
      var results = List.generate(maps['data']['packages'].length,
          (index) => Package.fromJson(maps?['data']['packages'][index]));
      listPackages.value = results;
      // Get.snackbar("Customer", "Fetched successfully");
    } else {
      Get.snackbar("Error", "Some Error Occurred in fetching Packages");
    }
  }
}

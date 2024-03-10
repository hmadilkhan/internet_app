import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_app/models/voucher_model.dart';
import 'package:internet_app/services/voucher_service.dart';

class VoucherContoller extends GetxController {
  final listVouchers = <Voucher>[].obs;

  @override
  void onInit() {
    super.onInit();
    allVouchers();
  }

  Future<void> generateVouchers() async {
    VoucherService service = VoucherService();
    var response = await service.generateVouchers();
    if (response.statusCode == 200) {
      // Get.snackbar("Customer", "Fetched successfully");
    } else {
      Get.snackbar("Error", "Error in Fetched");
    }
  }

  Future<void> allVouchers() async {
    VoucherService service = VoucherService();
    var response = await service.getVouchers();
    if (response.statusCode == 200) {
      final maps = json.decode(response.body);
      var results = List.generate(maps['data']['vouchers'].length,
          (index) => Voucher.fromJson(maps?['data']['vouchers'][index]));
      listVouchers.value = results;
      // Get.snackbar("Customer", "Fetched successfully");
    } else {
      Get.snackbar("Error", "Error in Fetched");
    }
  }

  Future<void> updateVouchers(id, status) async {
    VoucherService service = VoucherService();
    var response = await service.updateVoucher(id, status);
    if (response.statusCode == 200) {
      allVouchers();
      var statusText = (status == 0 ? "Unpaid" : "Paid");
      Get.snackbar(
        statusText,
        "Voucher $statusText successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white
      );
    } else {
      Get.snackbar("Error", "Error in Fetched");
    }
  }
}

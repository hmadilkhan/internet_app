import 'dart:convert';

import 'package:internet_app/utils/api_list.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class VoucherService {
  Future generateVouchers() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");
      final uri = Uri.parse(ApiList.generateVouchers);
      final response = await http.post(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': token.toString(),
      });
      return response;
    } catch (e) {
      return null;
    }
  }

  Future getVouchers() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");
      final uri = Uri.parse(ApiList.getVouchers);
      final response = await http.post(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': token.toString(),
      });
      return response;
    } catch (e) {
      return null;
    }
  }

  Future updateVoucher(id, status) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");
      Map body = {'id': id, 'status': status};
      String jsonBody = json.encode(body);
      final uri = Uri.parse(ApiList.updateVouchers);
      final response = await http.post(uri, body: jsonBody, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': token.toString(),
      });
      return response;
    } catch (e) {
      return null;
    }
  }
}

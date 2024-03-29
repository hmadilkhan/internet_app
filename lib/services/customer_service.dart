import 'dart:convert';

import 'package:internet_app/utils/api_list.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CustomerService {
  Future getCustomers() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");
      final uri = Uri.parse(ApiList.customers);
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

  Future getAreas() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");
      final uri = Uri.parse(ApiList.areas);
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

  Future getPackages() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");
      final uri = Uri.parse(ApiList.package);
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

  Future updateCustomers(int id, String name, String username, String mobile,
      String amount, String area, String package, String address) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");
      final uri = Uri.parse(ApiList.updateCustomers);
      Map body = {
        'id': id,
        'name': name,
        'username': username,
        'mobile': mobile,
        'amount': amount,
        'area_id': area,
        'package_id': package,
        'address': address
      };
      String jsonBody = json.encode(body);
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

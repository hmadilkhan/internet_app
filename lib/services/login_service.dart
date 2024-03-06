import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:internet_app/utils/api_list.dart';

class LoginService {
  Future login(email, password) async {
    Map body = {'username': email, 'password': password};
    String jsonBody = json.encode(body);
    try {
      final uri = Uri.parse(ApiList.login!);
      final response = await http.post(uri, body: jsonBody, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });
      return response;
    } catch (e) {
      return null;
    }
  }
}

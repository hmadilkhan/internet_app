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
}

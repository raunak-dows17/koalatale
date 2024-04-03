import 'dart:convert';

import 'package:http/http.dart';
import 'package:koalatale/utils/Apis/baseUrl.dart';

class Auth {
  Future<String> login(Map<String, String> formData) async {
    try {
      Response response = await post(
        Uri.parse("$baseUrl/auth/login"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(formData),
      );

      Map data = jsonDecode(response.body);

      return Future.value(data["token"]);
    } catch (e) {
      return Future.error(jsonDecode(e.toString()));
    }
  }
}

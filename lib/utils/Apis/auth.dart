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

      if (response.statusCode == 201) {
        Map data = jsonDecode(response.body);
        return data["token"];
      } else {
        Map<String, dynamic> errorBody = jsonDecode(response.body);
        String errorMessage = errorBody["message"] ?? "An error occurred";
        return Future.error(errorMessage);
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}

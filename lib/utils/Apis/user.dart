import 'dart:convert';

import 'package:http/http.dart';
import 'package:koalatale/utils/Apis/baseurl.dart';

class User {
  Future<Map> getUserData(token) async {
    try {
      Response response = await get(Uri.parse("$baseUrl/auth/user"), headers: {
        "token": token,
      });
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        return Future.value(data);
      } else {
        Map error = jsonDecode(response.body);
        return Future.error(error);
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}

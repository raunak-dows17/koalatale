import 'dart:convert';

import 'package:http/http.dart';
import 'baseUrl.dart';

class Stories {
  Future<Map> getStories() async {
    try {
      Response response = await get(Uri.parse("$baseUrl/story"));

      return Future.value(jsonDecode(response.body));
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<Map> getStoriesById(id) async {
    try {
      Response response = await get(Uri.parse("$baseUrl/story/$id"));

      return Future.value(jsonDecode(response.body));
    } catch (e) {
      return Future.error(e);
    }
  }
}

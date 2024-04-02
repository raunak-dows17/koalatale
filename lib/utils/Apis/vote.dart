import 'dart:convert';

import 'package:http/http.dart';
import 'package:koalatale/utils/Apis/baseurl.dart';
// import 'package:koalatale/utils/Tokens/tokens.dart';

class VoteAConrtibution {
  Future<Map> handleVotes(contributionId, String token) async {
    try {
      // String? token = await TokenDetails().getToken();
      // if (token == null) {
      //   throw Error();
      // }

      Response response = await post(
          Uri.parse("$baseUrl/contribution/$contributionId/vote"),
          headers: {
            "token": token,
          });

      return Future.value(jsonDecode(response.body));
    } catch (e) {
      return Future.error(e);
    }
  }
}

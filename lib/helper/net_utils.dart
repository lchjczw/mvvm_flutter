import 'dart:async';

//import 'package:mvvm_flutter/net/dio_utils.dart';

import '../di/app_module.dart';

Future _get(String url, {Map<String, dynamic> params}) async {
  var now = DateTime.now();

  if (url == '/api/v1/user/info') {
    return {
      "access_token":
          "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1OTAzOTI2MzYsImlhdCI6MTU4NzgwMDYzNiwibmJmIjoxNTg3ODAwNjM2LCJzdWIiOiJyb290In0.UyVtYLmALkW2QiQqskdlpHdGQjT1Rwe8o54zkQfNv_eHNrvztQjtI1OMnbgzXlMA03Fj5uv-UqJUdSVVp7s0Nw",
      "token_type": "Bearer",
      "expires_at": now.toIso8601String()
    };
  }

  return {
    'code': '0',
    "data": params,
    'message': '登录成功',
    'time': now.toIso8601String()
  };
}

Stream post(String url, Map<String, dynamic> params) =>
    Stream.fromFuture(_post(url, params)).asBroadcastStream();

Stream get(String url, {Map<String, dynamic> params}) {
  return Stream.fromFuture(_get(url, params: params)).asBroadcastStream();
}

Future _post(String url, Map<String, dynamic> params) async {
  //  return {'code': '0', "data": params, 'message': '登录成功'};
  return {
    "access_token":
        "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1OTAzOTI2MzYsImlhdCI6MTU4NzgwMDYzNiwibmJmIjoxNTg3ODAwNjM2LCJzdWIiOiJyb290In0.UyVtYLmALkW2QiQqskdlpHdGQjT1Rwe8o54zkQfNv_eHNrvztQjtI1OMnbgzXlMA03Fj5uv-UqJUdSVVp7s0Nw",
    "token_type": "Bearer",
    "expires_at": DateTime.now().toIso8601String()
  };
}

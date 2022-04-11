import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get/get_connect/connect.dart';

// import 'package:http/http.dart' as http;
import 'package:resik_app/src/config/constans_config.dart';

class ApiAuth extends GetConnect {
  final String url = '$globalApi/api';

  // ============ Auth

  Future<Response> login({dynamic data}) async {
    var res = await post('$url/login', jsonEncode(data), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    return getRes(res);
  }

  // Future<Response> getUser() async {
  //   String token = await getToken();

  //   var res =
  //       await get('$url/user', headers: {'Authorization': 'Bearer $token'});

  //   return getRes(res);
  // }

  // Future<Response> changePassword({dynamic data}) async {
  //   String token = await getToken();

  //   var res =
  //       await post('$url/v1/user/change-password', jsonEncode(data), headers: {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer $token'
  //   });

  //   return getRes(res);
  // }

  // Future<http.Response> changeProfile({required XFile data}) async {
  //   String token = await getToken();

  //   try {
  //     var request = http.MultipartRequest(
  //       'POST',
  //       Uri.parse('$url/v1/user/change-photo'),
  //     );

  //     request.headers['Authorization'] = 'Bearer $token';
  //     request.files.add(await http.MultipartFile.fromPath('image', data.path));

  //     var response = await request.send();
  //     var res = http.Response.fromStream(response);

  //     return res;
  //   } on SocketException catch (e) {
  //     throw Exception(e.toString());
  //   } on HttpException {
  //     {
  //       throw Exception("tidak menemukan post");
  //     }
  //   } on FormatException {
  //     throw Exception("request salah");
  //   } on TimeoutException catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }
}

// ==========================================

Future<Response> getRes(Response res) async {
  try {
    return res;
  } on SocketException catch (e) {
    throw Exception(e.toString());
  } on HttpException {
    {
      throw Exception("tidak menemukan post");
    }
  } on FormatException {
    throw Exception("request salah");
  } on TimeoutException catch (e) {
    throw Exception(e.toString());
  }
}

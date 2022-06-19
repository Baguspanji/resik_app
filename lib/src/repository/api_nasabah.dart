import 'dart:async';
import 'dart:io';

import 'package:get/get_connect/connect.dart';

// import 'package:http/http.dart' as http;
import 'package:resik_app/src/config/constans_config.dart';
import 'package:resik_app/src/repository/s_preference.dart';

class ApiNasabah extends GetConnect {
  final String url = '$globalApi/api';

  // ============ Sampah ============

  Future<Response> getSampah() async {
    String token = await getToken();

    var res = await get('$url/sampah', headers: {'Authorization': token});

    return getRes(res);
  }

  Future<Response> setorSampah({required dynamic data}) async {
    String token = await getToken();

    var res = await post(
      '$url/sampah/setor',
      (data),
      headers: {
        'Authorization': token,
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    return getRes(res);
  }

  Future<Response> getHistory() async {
    String token = await getToken();

    var res = await get(
      '$url/histori/setor',
      headers: {'Authorization': token},
    );

    return getRes(res);
  }

  Future<Response> getWidraw() async {
    String token = await getToken();

    var res = await get(
      '$url/histori/tarik-saldo',
      headers: {'Authorization': token},
    );

    return getRes(res);
  }

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

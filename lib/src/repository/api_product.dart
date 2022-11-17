import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';

class ApiProduct extends GetConnect {
  final String url = 'https://jongjavatech.com/simpelin/public';

  // ============ Sampah ============

  Future<Response> getProduct() async {
    var res = await get('$url/api/produk');

    return getRes(res);
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
}

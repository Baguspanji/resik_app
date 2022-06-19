import 'package:get/get.dart';
import 'package:resik_app/src/model/sampah_model.dart';
import 'package:resik_app/src/model/widget_model.dart';
import 'package:resik_app/src/repository/api_nasabah.dart';

class SampahController extends GetxController {
  final api = ApiNasabah();

  final sampah = <SampahModel>[].obs;
  final listSampah = <SampahCountModel>[].obs;

  Future<void> getSampah() async {
    try {
      final res = await api.getSampah();
      sampah.value = res.body['data'] != null
          ? (res.body['data'] as List)
              .map((e) => SampahModel.fromJson(e))
              .toList()
          : [];
    } catch (e) {
      print(e.toString());
    }
  }
}

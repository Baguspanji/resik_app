import 'package:get/get.dart';
import 'package:resik_app/src/config/constans_config.dart';
import 'package:resik_app/src/model/sampah_model.dart';
import 'package:resik_app/src/model/widget_model.dart';
import 'package:resik_app/src/repository/api_nasabah.dart';

class SampahController extends GetxController {
  final api = ApiNasabah();

  final sampah = <SampahModel>[].obs;
  final listSampah = <SampahCountModel>[].obs;

  Future<void> getSampah() async {
    try {
      var res = await api.getSampah();
      if (res.statusCode == 200) {
        sampah.value = res.body['data'] != null
            ? (res.body['data'] as List)
                .map((e) => SampahModel.fromJson(e))
                .toList()
            : [];

        listSampah.value =
            sampah.value.map((e) => SampahCountModel(e.id!, 0)).toList();
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> setorSampah() async {
    var sampah = listSampah.value.where((e) => e.qty > 0);

    dynamic data = {
      ...sampah.map((e) => {
            'id': e.id,
            'qty': e.qty,
          }),
    };

    try {
      var res = await api.setorSampah(data: data);

      if (res.statusCode == 200) {
        getToast('Berhasil setor sampah');
        await Future.delayed(Duration(seconds: 1));
        Get.back();
        getSampah();
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}

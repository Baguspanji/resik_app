import 'package:get/get.dart';
import 'package:resik_app/src/model/history_setor_model.dart';
import 'package:resik_app/src/model/history_widraw_model.dart';
import 'package:resik_app/src/repository/api_nasabah.dart';

class HistoryController extends GetxController {
  final api = ApiNasabah();

  final historySetor = <HistorySampahModel>[].obs;
  final historyWidraw = <HistoryWidrawModel>[].obs;

  Future<void> getHistory() async {
    try {
      var res = await api.getHistory();

      if (res.statusCode == 200) {
        historySetor.value = res.body['data'] != null
            ? (res.body['data'] as List)
                .map((e) => HistorySampahModel.fromJson(e))
                .toList()
            : [];
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<void> getWidraw() async {
    try {
      var res = await api.getWidraw();

      if (res.statusCode == 200) {
        historyWidraw.value = res.body['data'] != null
            ? (res.body['data'] as List)
                .map((e) => HistoryWidrawModel.fromJson(e))
                .toList()
            : [];
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}

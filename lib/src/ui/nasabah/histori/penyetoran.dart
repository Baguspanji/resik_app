import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resik_app/src/config/constans_config.dart';
import 'package:resik_app/src/controller/histori_controller.dart';
import 'package:resik_app/src/model/history_setor_model.dart';
import 'package:resik_app/src/ui/nasabah/components/modal.dart';
import 'package:resik_app/src/ui/nasabah/histori/modal_setor.dart';

class Penyetoran extends StatelessWidget {
  final historiCon = Get.find<HistoryController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final history = historiCon.historySetor.value;

      if (history.isEmpty) {
        return Center(
          child: Text('Tidak ada data'),
        );
      } else {
        return ListView(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          children: [
            ...history.map((e) {
              return _itemHistori(context, e);
            }).toList(),
          ],
        );
      }
    });
  }

  Future<void> showQR(BuildContext context, HistorySampahModel item) async {
    Modals.showCupertinoModal(
      context: context,
      builder: ModalSetorUI(item: item),
    );
  }

  Widget _itemHistori(BuildContext context, HistorySampahModel item) {
    Color bg = Colors.white;
    bool isTrailing = false;
    String title = 'Berhasil';

    switch (item.status) {
      case 'pending':
        title = 'Dalam Proses';
        isTrailing = true;
        bg = Colors.greenAccent.shade100;
        break;
      case 'failed':
        title = 'Proses Gagal';
        bg = Colors.red.withOpacity(0.2);
        break;
      default:
    }

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
        border: isTrailing
            ? Border.all(color: bg)
            : Border.all(color: Colors.grey.shade300),
      ),
      child: ListTile(
        onTap: () => showQR(context, item),
        leading: Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: primaryColor,
          ),
          child: Text(
            'CS',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        title: Text(capitalize(title)),
        subtitle: Text(
          dateFormatEEEEdMMMMyyyy(DateTime.parse(item.createdAt ?? '')),
          style: TextStyle(
            fontSize: 12,
            color: Colors.black45,
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: isTrailing ? Icon(Icons.qr_code_outlined) : null,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resik_app/src/config/constans_config.dart';
import 'package:resik_app/src/controller/sampah_controller.dart';
import 'package:resik_app/src/model/sampah_model.dart';
import 'package:resik_app/src/model/widget_model.dart';
import 'package:resik_app/src/ui/nasabah/components/custom_app.dart';

class CartUI extends StatelessWidget {
  static const String routeName = "/cart";

  final conSampah = Get.put(SampahController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          customApp(context, 'Keranjang Sampah', isBack: true),
          Expanded(
            child: Obx(() {
              var sampah = conSampah.listSampah.value.where((e) => e.qty > 0);

              if (sampah.isEmpty) {
                return Center(
                  child: Text('Tidak ada sampah'),
                );
              } else {
                return ListView(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  children: sampah.map((e) => _itemSampah(context, e)).toList(),
                );
              }
            }),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: InkWell(
              onTap: () => conSampah.setorSampah(),
              child: Container(
                height: 42,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 80),
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  'Setor Sampah',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemSampah(BuildContext context, SampahCountModel item) {
    SampahModel sampah = conSampah.sampah.firstWhere((e) => e.id == item.id);

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: ListTile(
        leading: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            image: DecorationImage(
              image: NetworkImage(
                'https://www.gstatic.com/webp/gallery/1.sm.jpg',
              ),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 3),
              )
            ],
          ),
        ),
        title: Text(sampah.product != null ? sampah.product!.namaSampah! : ''),
        subtitle: Text(sampah.product != null
            ? toRupiah(double.parse(sampah.hargaSetor ?? '0'))
            : 'Rp 0'),
        trailing: Container(
          width: 20,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            '${item.qty}',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

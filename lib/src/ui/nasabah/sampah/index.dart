import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resik_app/src/config/constans_config.dart';
import 'package:resik_app/src/config/size_config.dart';
import 'package:resik_app/src/controller/sampah_controller.dart';
import 'package:resik_app/src/model/sampah_model.dart';
import 'package:resik_app/src/model/widget_model.dart';
import 'package:resik_app/src/ui/nasabah/components/custom_app.dart';
import 'package:resik_app/src/ui/nasabah/sampah/components/cart.dart';

class SampahUI extends StatefulWidget {
  @override
  State<SampahUI> createState() => _SampahUIState();
}

class _SampahUIState extends State<SampahUI> {
  final conSampah = Get.put(SampahController());
  bool isLoading = false;

  List<SampahCountModel> listSampah = [];

  @override
  void initState() {
    super.initState();
    getSampah();
  }

  Future<void> getSampah() async {
    setState((() => isLoading = true));
    await conSampah.getSampah();
    setState(() {
      listSampah = conSampah.sampah.value
          .map((e) => SampahCountModel(e.id!, 0))
          .toList();
    });
    conSampah.listSampah.value = listSampah;
    setState((() => isLoading = false));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customApp(context, 'Daftar Sampah', child: Obx(() {
          var count = conSampah.listSampah.value.where((e) => e.qty > 0);

          return InkWell(
            onTap: () => Get.toNamed(CartUI.routeName),
            child: SizedBox(
              width: width(context) * 0.15,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 10,
                    child: Container(
                      width: 16,
                      height: 16,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.8),
                      ),
                      child: Text(
                        count.length.toString(),
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        })),
        Expanded(
          child: Obx(() {
            var sampah = conSampah.sampah.value;

            if (isLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

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
        Obx(() {
          var count = conSampah.listSampah.value.where((e) => e.qty > 0);

          return Visibility(
            visible: count.isNotEmpty,
            child: Container(
              height: 60,
              width: width(context),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: InkWell(
                onTap: () {
                  if (count.isEmpty) {
                    Get.defaultDialog(
                      title: 'Peringatan',
                      content: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Tidak ada sampah yang dapat disetor',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  } else {}
                },
                child: Container(
                  height: 54,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 80),
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(30),
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
          );
        })
      ],
    );
  }

  Widget _itemSampah(BuildContext context, SampahModel sampah) {
    int qty = listSampah.firstWhere((e) => e.id == sampah.id).qty;

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
          width: width(context) * 0.22,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  if (qty > 0) {
                    setState(() {
                      qty--;
                      listSampah.firstWhere((e) => e.id == sampah.id).qty = qty;
                    });
                    conSampah.listSampah.value = listSampah;
                  }
                },
                child: Card(
                  color: secondaryColor,
                  child: Icon(
                    Icons.arrow_drop_down,
                    size: 22,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  '$qty',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    qty++;
                    listSampah.firstWhere((e) => e.id == sampah.id).qty = qty;
                  });
                  conSampah.listSampah.value = listSampah;
                },
                child: Card(
                  color: secondaryColor,
                  child: Icon(
                    Icons.arrow_drop_up,
                    size: 22,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

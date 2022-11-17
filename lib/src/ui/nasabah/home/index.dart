import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resik_app/src/config/constans_config.dart';
import 'package:resik_app/src/config/size_config.dart';
import 'package:resik_app/src/controller/product_controller.dart';
import 'package:resik_app/src/model/product_model.dart';

class HomeUI extends StatefulWidget {
  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  final conProduct = Get.put(ProductController());

  @override
  void initState() {
    conProduct.getProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 32),
            Container(
              width: width(context),
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Snack',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: width(context) * 0.5,
              child: Obx(() {
                final products = conProduct.listProduct.value;

                if (products.isEmpty) {
                  return Container(
                    height: width(context) * 0.5,
                    width: width(context),
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      color: Colors.orange,
                    ),
                  );
                }

                return ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ...products.map((e) => _itemProduct(context, e)),
                  ],
                );
              }),
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _itemProduct(BuildContext context, ProductModel item) {
    return Container(
      width: width(context) * 0.4,
      height: width(context) * 0.5,
      margin: EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width(context) * 0.4,
            height: width(context) * 0.3,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.namaProduk ?? '-',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black45,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  item.deskripsi ?? '-',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.black45,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  toRupiah(double.parse(item.harga ?? "0")),
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black45,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

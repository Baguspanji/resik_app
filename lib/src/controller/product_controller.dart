import 'package:get/get.dart';
import 'package:resik_app/src/model/product_model.dart';
import 'package:resik_app/src/repository/api_product.dart';

class ProductController extends GetxController {
  final api = ApiProduct();

  final listProduct = <ProductModel>[].obs;

  Future<void> getProduct() async {
    var res = await api.getProduct();
    List<ProductModel> products = [];

    listProduct.value = res.statusCode == 200
        ? [...(res.body['data'] as List).map((e) => ProductModel.fromJson(e))]
        : [];
  }
}

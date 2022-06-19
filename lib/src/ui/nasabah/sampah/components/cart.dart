import 'package:flutter/material.dart';
import 'package:resik_app/src/ui/nasabah/components/custom_app.dart';

class CartUI extends StatelessWidget {
  static const String routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          customApp(context, 'Keranjang Sampah', isBack: true),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:resik_app/src/config/constans_config.dart';
import 'package:resik_app/src/config/size_config.dart';
import 'package:resik_app/src/ui/nasabah/components/custom_app.dart';

class SampahUI extends StatelessWidget {
  const SampahUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customApp(context, 'Daftar Sampah'),
      ],
    );
  }
}

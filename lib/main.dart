import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:resik_app/src/app.dart';

void main() async {
  await initializeDateFormatting('id_ID', null).then((_) => runApp(MyApp()));
}

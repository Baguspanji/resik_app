import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resik_app/src/config/route_config.dart';
import 'package:resik_app/src/config/theme_config.dart';
import 'package:resik_app/src/ui/splash/index.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Resik',
      initialRoute: SplashUI.routeName,
      theme: theme(),
      getPages: routes,
    );
  }
}

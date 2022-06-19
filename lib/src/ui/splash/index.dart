import 'dart:async';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:resik_app/src/config/constans_config.dart';
import 'package:resik_app/src/config/size_config.dart';
import 'package:resik_app/src/controller/auth_controller.dart';
import 'package:resik_app/src/repository/s_preference.dart';
import 'package:resik_app/src/ui/nasabah/home/index.dart';
import 'package:resik_app/src/ui/nasabah/nav_ui.dart';

class SplashUI extends StatefulWidget {
  static const String routeName = "/splash";

  @override
  _SplashUIState createState() => _SplashUIState();
}

class _SplashUIState extends State<SplashUI> {
  final conAuth = Get.put(AuthController());

  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() async {
    await Future.delayed(Duration(seconds: 2));
    Get.offAllNamed(NavUI.routeName);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: secondaryColor),
        child: Column(
          children: [
            SizedBox(height: 300),
            // Image(
            //   image: AssetImage(logo),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Resik App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Resik App',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

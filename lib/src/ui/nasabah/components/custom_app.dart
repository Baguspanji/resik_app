import 'package:flutter/material.dart';
import 'package:resik_app/src/config/constans_config.dart';
import 'package:resik_app/src/config/size_config.dart';

Widget customApp(BuildContext context, String title) {
  return Container(
    height: height(context) * 0.12,
    width: width(context),
    alignment: Alignment.bottomCenter,
    padding: EdgeInsets.symmetric(vertical: 20),
    decoration: BoxDecoration(
      color: secondaryColor,
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 6,
          offset: Offset(0, 3),
        )
      ],
    ),
    child: Text(
      title,
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

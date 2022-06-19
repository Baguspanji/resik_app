import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resik_app/src/config/constans_config.dart';
import 'package:resik_app/src/config/size_config.dart';

Widget customApp(BuildContext context, String title,
    {Widget? child, bool isBack = false}) {
  return Container(
    height: height(context) * 0.12,
    width: width(context),
    alignment: Alignment.bottomCenter,
    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
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
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        isBack
            ? SizedBox(
                width: width(context) * 0.15,
                child: InkWell(
                  onTap: () => Get.back(),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              )
            : SizedBox(width: width(context) * 0.15),
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        (child == null) ? SizedBox(width: width(context) * 0.15) : child,
      ],
    ),
  );
}

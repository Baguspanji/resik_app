import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:resik_app/src/config/constans_config.dart';

const Curve curve = Curves.easeInOut;
const Duration duration = const Duration(milliseconds: 300);

class Modals {
  static Future<T?> showCupertinoModal<T>({
    required BuildContext context,
    required Widget builder,
    bool isDraggable = true,
    bool isDismissible = true,
  }) async {
    final result = await showCupertinoModalBottomSheet<T>(
      context: context,
      enableDrag: isDraggable,
      isDismissible: isDismissible,
      builder: (_) => Material(child: builder),
      useRootNavigator: false,
      animationCurve: curve,
      duration: duration,
    );
    return result;
  }

  static Future<void> showModal({
    required String title,
    required String subTitle,
    Widget? subTitleWidget,
    String? confirmText,
    String? cancleText,
    void Function()? confirmAction,
    void Function()? cancleAction,
  }) async {
    Get.defaultDialog(
      radius: 16,
      titlePadding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      title: 'Peringatan',
      content: subTitleWidget ??
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              subTitle,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
      confirm: confirmText == null
          ? null
          : InkWell(
              onTap: () async {
                if (confirmAction != null) {
                  Get.back();
                  await Future.delayed(Duration(milliseconds: 400));
                  confirmAction();
                } else {
                  Get.back();
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  confirmText,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
      cancel: cancleText == null
          ? null
          : InkWell(
              onTap: () => cancleAction ?? Get.back(),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: redColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  cancleText,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
    );
  }
}

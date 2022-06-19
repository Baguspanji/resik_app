import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resik_app/src/config/constans_config.dart';
import 'package:resik_app/src/config/size_config.dart';
import 'package:resik_app/src/controller/histori_controller.dart';
import 'package:resik_app/src/ui/nasabah/components/custom_app.dart';
import 'package:resik_app/src/ui/nasabah/histori/penarikan.dart';
import 'package:resik_app/src/ui/nasabah/histori/penyetoran.dart';

class HistoriUI extends StatefulWidget {
  @override
  State<HistoriUI> createState() => _HistoriUIState();
}

class _HistoriUIState extends State<HistoriUI> {
  final historiCon = Get.put(HistoryController());

  int indexNav = 0;

  List<String> listNav = [
    "Penyetoran",
    "Penarikan",
  ];

  List<Widget> listWidget = [
    Penyetoran(),
    Penarikan(),
  ];

  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    historiCon.getHistory();
    historiCon.getWidraw();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customApp(context, 'Histori Sampah'),
        Container(
          height: height(context) * 0.05,
          width: width(context),
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (var i = 0; i < listNav.length; i++)
                _itemNav(context, listNav[i], i == indexNav),
            ],
          ),
        ),
        Expanded(
          child: RefreshIndicator(
            color: secondaryColor,
            onRefresh: () => init(),
            child: listWidget[indexNav],
          ),
        )
      ],
    );
  }

  Widget _itemNav(BuildContext context, String title,
      [bool isSelected = false]) {
    return GestureDetector(
      onTap: () => setState(() {
        indexNav = listNav.indexOf(title);
      }),
      child: Container(
        height: height(context) * 0.05,
        width: width(context) / 2,
        alignment: Alignment.center,
        decoration: isSelected
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.white, width: 2),
                ),
              )
            : BoxDecoration(),
        child: Text(
          title,
          style: isSelected
              ? TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                )
              : TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
        ),
      ),
    );
  }
}

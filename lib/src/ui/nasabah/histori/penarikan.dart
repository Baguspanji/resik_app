import 'package:flutter/material.dart';
import 'package:resik_app/src/config/constans_config.dart';
import 'package:resik_app/src/config/size_config.dart';

class Penarikan extends StatelessWidget {
  const Penarikan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      children: [
        _itemHistori(context, "Selasa , 12 Januari 2020", "pending"),
        _itemHistori(context, "Selasa , 12 Januari 2020", "success"),
        _itemHistori(context, "Selasa , 12 Januari 2020", "failed"),
      ],
    );
  }

  Widget _itemHistori(BuildContext context, String date, String status) {
    Color bg = Colors.white;
    switch (status) {
      case 'pending':
        bg = Colors.black12;
        break;
      case 'failed':
        bg = Colors.red.withOpacity(0.2);
        break;
      default:
    }

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blueAccent,
          ),
          child: Text(
            'BS',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        title: Text(capitalize(status)),
        subtitle: Text(
          date,
          style: TextStyle(
            fontSize: 12,
            color: Colors.black45,
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.keyboard_arrow_right_outlined,
            size: 32,
          ),
        ),
      ),
    );
  }
}

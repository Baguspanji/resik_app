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
        Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            children: [
              _itemSampah(context),
              _itemSampah(context),
              _itemSampah(context),
            ],
          ),
        )
      ],
    );
  }

  Widget _itemSampah(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: ListTile(
        leading: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            image: DecorationImage(
              image: NetworkImage(
                'https://www.gstatic.com/webp/gallery/1.sm.jpg',
              ),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 3),
              )
            ],
          ),
        ),
        title: Text('Kardus Indomie'),
        subtitle: Text('Rp 800'),
        trailing: Container(
          width: width(context) * 0.22,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                color: secondaryColor,
                child: Icon(
                  Icons.arrow_drop_up,
                  size: 22,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  '0',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Card(
                color: secondaryColor,
                child: Icon(
                  Icons.arrow_drop_down,
                  size: 22,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

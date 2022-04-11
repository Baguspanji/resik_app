import 'package:flutter/material.dart';
import 'package:resik_app/src/config/constans_config.dart';
import 'package:resik_app/src/config/size_config.dart';
import 'package:resik_app/src/ui/nasabah/components/custom_app.dart';

class ProfileUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customApp(context, 'Profile'),
        Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            children: [
              Container(
                width: width(context),
                height: height(context) * 0.1,
                alignment: Alignment.center,
                child: ListTile(
                  leading: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
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
                  title: Text('William Betrand'),
                  subtitle: Text('Bank Sampah Tegalan'),
                  trailing: Icon(
                    Icons.settings,
                    size: 28,
                  ),
                ),
              ),
              Container(
                width: width(context),
                height: height(context) * 0.1,
                alignment: Alignment.center,
                child: ListTile(
                  title: Text('Saldo'),
                  subtitle: Text('Rp 32.000'),
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Text('version 1.2.0'),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.all(20),
                width: width(context),
                height: height(context) * 0.05,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: redColor),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Keluar',
                  style: TextStyle(
                    fontSize: 16,
                    color: redColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

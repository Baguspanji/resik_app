import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resik_app/src/config/constans_config.dart';
import 'package:resik_app/src/config/size_config.dart';
import 'package:resik_app/src/controller/auth_controller.dart';

class ProfileUI extends StatefulWidget {
  @override
  State<ProfileUI> createState() => _ProfileUIState();
}

class _ProfileUIState extends State<ProfileUI> {
  final conAuth = Get.find<AuthController>();
  bool isLoading = false;

  @override
  void initState() {
    getUser();
    super.initState();
  }

  void getUser() async {
    setState((() => isLoading = true));
    conAuth.getUser();
    setState((() => isLoading = false));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: height(context) * 0.05),
        Container(
          width: width(context),
          height: height(context) * 0.1,
          alignment: Alignment.center,
          child: Obx(() {
            var user = conAuth.user.value;

            if (isLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (user.nama == null) {
              return ListTile(
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
              );
            } else {
              return ListTile(
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
                title: Text(user.nama ?? ''),
                subtitle:
                    Text(user.bankSampah != null ? user.bankSampah!.nama! : ''),
                trailing: Icon(
                  Icons.settings,
                  size: 28,
                ),
              );
            }
          }),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            children: [
              Obx(() {
                var user = conAuth.user.value;

                if (isLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (user.nama == null) {
                  return Container();
                } else {
                  return Container(
                    width: width(context),
                    height: height(context) * 0.06,
                    alignment: Alignment.center,
                    child: ListTile(
                      title: Text('Saldo'),
                      subtitle: Text(toRupiah(double.parse('${user.saldo}'))),
                    ),
                  );
                }
              }),
            ],
          ),
        ),
        Column(
          children: [
            Text('version 1.2.0'),
            GestureDetector(
              onTap: () => conAuth.logout(),
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

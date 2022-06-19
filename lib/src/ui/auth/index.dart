import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resik_app/src/config/constans_config.dart';
import 'package:resik_app/src/config/size_config.dart';
import 'package:resik_app/src/controller/auth_controller.dart';
import 'package:resik_app/src/ui/nasabah/nav_ui.dart';

class AuthUI extends StatefulWidget {
  static String routeName = "/auth";

  @override
  State<AuthUI> createState() => _AuthUIState();
}

class _AuthUIState extends State<AuthUI> {
  final conAuth = Get.put(AuthController());

  final emailText = TextEditingController();
  final passwordText = TextEditingController();

  void onLogin() async {
    if (emailText.text == '' || passwordText.text == '') {
      getToast('Email dan Password tidak boleh kosong');
    } else {
      var auth = await conAuth.login(emailText.text, passwordText.text);
      if (auth) {
        getToast('Berhasil Login');
        Get.offAllNamed(NavUI.routeName);
      } else {
        getToast('Email atau Password salah');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height(context) * 0.2),
            Text(
              "Resik",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: secondaryColor,
              ),
            ),
            SizedBox(height: height(context) * 0.1),
            _input(
              context,
              "Email",
              Icon(
                Icons.email,
                color: secondaryColor,
              ),
              emailText,
            ),
            SizedBox(height: 20),
            _input(
                context,
                "Password",
                Icon(
                  Icons.key,
                  color: secondaryColor,
                ),
                passwordText,
                isPassword: true),
            SizedBox(height: 40),
            SizedBox(
              width: width(context),
              child: button(
                "Login",
                onPressed: onLogin,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {},
              child: Text(
                'Syarat dan ketentuan berlaku',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 14,
                  color: Colors.black54,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _input(
    BuildContext context,
    String hint,
    Icon icon,
    TextEditingController controller, {
    bool isPassword = false,
  }) {
    return Container(
      width: width(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
        border: Border.all(
          color: secondaryColor,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: icon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

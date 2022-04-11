import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'size_config.dart';
import 'dart:ui' as ui;

const globalApi = 'https://';

const cardColor = Color(0xFFFAFBFB);
const primaryColor = Color(0xFF63fbcb);
const secondaryColor = Color(0xFF1b711b);
const redColor = Color(0xFFCB3A31);
const yellowColor = Color(0xFFFFD500);
const yellowOrangeColor = Color(0xFFFDC500);
const blueColor = Color(0xFF00509D);
const mediumBlueColor = Color(0xFF003F88);
const darkBlueColor = Color(0xFF00296B);
const baghroundColor = Color(0xFFF5F5F5);
const textColor = Color(0xFF404040);
const textGrayColor = Color(0xFFC2C2C2);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kUsernameNullError = "Please Enter your Email or Username";
const String kInvalidUsernameError = "Email or Username is too short";
const String kUsername1NullError = "Please Enter your Username";
const String kInvalidUsername1Error = "Username is too short";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

const String kUnauthorizedError = "SignIn Failed";

const String noImage = 'assets/images/logo.png';

final otpInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: getWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getWidth(15)),
    borderSide: BorderSide(color: textColor),
  );
}

final formatter = NumberFormat('#,##0', 'id_ID');
String toRupiah(int number) => 'Rp ${formatter.format(number)}';

String formatTime(DateTime dateTime) {
  return DateFormat('kk:mm:ss').format(dateTime);
}

String dateFormatddMMMMyyyyhhmm(DateTime? date) {
  if (date != null)
    return '${DateFormat(
      'dd MMMM yyyy, HH:mm',
      'id_ID',
    ).format(date)}';
  return '';
}

String dateFormatddMMMMyyyy(DateTime? date) {
  if (date != null)
    return '${DateFormat(
      'dd MMMM yyyy',
      'id_ID',
    ).format(date)}';
  return '';
}

String dateFormatEEEEdMMMMyyyyhhmm(DateTime? date) {
  if (date != null)
    return '${DateFormat(
      'EEEE, d MMMM yyyy, HH:mm',
      'id_ID',
    ).format(date)}';
  return '';
}

String dateFormatEEEEdMMMMyyyy(DateTime? date) {
  if (date != null)
    return '${DateFormat(
      'EEEE, d MMMM yyyy',
      'id_ID',
    ).format(date)}';
  return '';
}

String dateFormatyyyyMMdd(DateTime? date) {
  if (date != null) return '${DateFormat("yyyy-MM-dd", "id_ID").format(date)}';
  return '';
}

bool hasTextOverflow(
  String text,
  TextStyle style, {
  double minWidth = 0,
  double maxWidth = double.infinity,
  int maxLines = 4,
}) {
  final TextPainter textPainter = TextPainter(
    text: TextSpan(text: text, style: style),
    maxLines: maxLines,
    textDirection: ui.TextDirection.ltr,
  )..layout(
      minWidth: minWidth,
      maxWidth: maxWidth,
    );
  return textPainter.didExceedMaxLines;
}

void getToast(String text) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black45,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

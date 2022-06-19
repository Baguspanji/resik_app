import 'package:get/get.dart';
import 'package:resik_app/src/model/user_model.dart';
import 'package:resik_app/src/repository/api_auth.dart';
import 'package:resik_app/src/repository/s_preference.dart';
import 'package:resik_app/src/ui/nasabah/nav_ui.dart';

class AuthController extends GetxController {
  final api = ApiAuth();

  final user = UserModel().obs;

  RxBool isloggedIn = false.obs;

  Future<bool> login(String username, String password) async {
    try {
      final res =
          await api.login(data: {"username": username, "password": password});
      if (res.body['access_token'] != null) {
        setToken('Bearer ${res.body['access_token']}');
        setRole(res.body['role']);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<void> logout() async {
    await rmvToken();
    await rmvRole();
    isloggedIn.value = false;
    Get.offAndToNamed(NavUI.routeName);
  }

  Future<void> getUser() async {
    try {
      final res = await api.getUser();
      user.value = res.body['data'] != null
          ? UserModel.fromJson(res.body['data'])
          : UserModel();
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}

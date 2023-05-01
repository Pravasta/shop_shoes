import 'package:flutter/foundation.dart';

import 'package:shop_shoes/models/user_model.dart';
import 'package:shop_shoes/services/auth_services.dart';

class AuthProvider with ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  set user(UserModel? user) {
    _user = user;
    notifyListeners();
  }

  // Mmebuat function melakukan register
  Future<bool> register(
      String name, String username, String email, String password) async {
    try {
      UserModel user = await AuthService().register(
        name,
        username,
        email,
        password,
      );

      // Kalau berhasil
      // _user dari _user atas
      _user = user;
      return true; //Artinya berhasil mendaftar
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }

  Future<bool> login(String email, String password) async {
    try {
      UserModel user = await AuthService().login(
        email,
        password,
      );

      // Kalau berhasil
      // _user dari _user atas
      _user = user;
      return true; //Artinya berhasil mendaftar
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }
}

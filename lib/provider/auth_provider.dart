import 'package:flutter/material.dart';
import 'package:mobile_document/api/auth.dart';
import 'package:mobile_document/components/messageHepler.dart';
import 'package:mobile_document/router/router.dart';
import 'package:nav_service/nav_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthApi _authApi = AuthApi();
  bool _loading = false;
  dynamic _user;
  final email = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final newPassword = TextEditingController();
  final phoneNumber = TextEditingController();

  get loading => _loading;
  get user => _user;

  Future<void> Login() async {
    _loading = true;
    try {
      final result = await _authApi.Login(
        email: email.text,
        password: password.text,
      );
      if (result == true) {
        _loading = false;
        MessageHelper.showSnackBarMessage(
          isSuccess: true,
          message: "Login Success",
        );
        NavService.pushReplacementNamed(RouterAPI.home);
        clear();
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      MessageHelper.showSnackBarMessage(
        isSuccess: false,
        message: e.toString(),
      );
      notifyListeners();
    }
  }

  Future<void> Register() async {
    _loading = true;
    try {
      final result = await _authApi.Register(
        email: email.text,
        password: password.text,
        usernamme: username.text,
        phoneNumber: phoneNumber.text,
      );
      if (result == true) {
        _loading = false;
        MessageHelper.showSnackBarMessage(
          isSuccess: true,
          message: "Register Success",
        );
        clear();
        NavService.pop();
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      MessageHelper.showSnackBarMessage(
        isSuccess: false,
        message: e.toString(),
      );
      notifyListeners();
    }
  }

  Future<void> Forgot() async {
    _loading = true;
    try {
      final result = await _authApi.Forgot(
        email: email.text,
        password: password.text,
      );
      if (result == true) {
        _loading = false;
        MessageHelper.showSnackBarMessage(
          isSuccess: true,
          message: "Forgot Success",
        );
        clear();
        NavService.pop();
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      MessageHelper.showSnackBarMessage(
        isSuccess: false,
        message: e.toString(),
      );
      notifyListeners();
    }
  }

  void clear() {
    username.clear();
    email.clear();
    password.clear();
    phoneNumber.clear();
    newPassword.clear();
  }
}

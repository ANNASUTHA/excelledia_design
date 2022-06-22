

import 'package:flutter/material.dart';


extension StringExtension on String {
  bool get isValidEmail {
    //final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    final emailRegExp = RegExp(r'^([a-z]{1})([a-z0-9]+)[@]([g][m][a][i][l][.][c][o][m])$');
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    // final nameRegExp = new RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']|))+[A-Za-z]+\.?\s*$");
    final nameRegExp = RegExp(r'^(([A-Za-z]{1,})[\s]{0,1}){1,}(?<!\s)$',
        caseSensitive: false, unicode: true, dotAll: true);
    return nameRegExp.hasMatch(this);
  }

  /*bool get isValidUserName {
    // final nameRegExp = new RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']|))+[A-Za-z]+\.?\s*$");
    final nameRegExp = RegExp(
        r"^[a-zA-Z0-9]([._-](?![._-])|[a-zA-Z0-9]){3,18}[a-zA-Z0-9]$",
        caseSensitive: false,
        unicode: true,
        dotAll: true);
    return nameRegExp.hasMatch(this);
  }*/

  bool get isValidPassword {
    final passwordRegExp =
    RegExp(r'^([a-zA-Z0-9@$!%*?&]{8,})$');
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull {
    return this != null;
  }

  // bool get isValidPhone {
  //   final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
  //   return phoneRegExp.hasMatch(this);
  // }
  bool get isValidPhone {
    final phoneRegExp = RegExp(r'^([+][0-9]{2,3})[-]([0-9]{10})$');
    return phoneRegExp.hasMatch(this);
  }
}

extension NavigationExtension on BuildContext {
  NavigatorState get navigation => Navigator.of(this);
  Future<void> pop() async {
    return navigation.pop();
  }

  Future<T?> navigateName<T>(String path, {Object? data}) async {
    return await navigation.pushNamed<T>(path, arguments: data);
  }

  Future<T?> navigateToReset<T>(String path, {Object? data}) async {
    return await navigation.pushNamedAndRemoveUntil(path, (route) => false,
        arguments: data);
  }
}
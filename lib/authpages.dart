import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:testtrasnsisi/api_services/securestorage.dart';
import 'package:testtrasnsisi/views/homepages.dart';
import 'package:testtrasnsisi/views/loginpages.dart';

class AuthPages extends StatefulWidget {
  const AuthPages({Key? key}) : super(key: key);

  @override
  State<AuthPages> createState() => _AuthPagesState();
}

class _AuthPagesState extends State<AuthPages> {
  SecureStorage secureStorage = SecureStorage();
  @override
  void initState() {
    checkToken();
    super.initState();
  }

  checkToken() async {
    var authToken = await secureStorage.readSecureData('authToken');
    if (authToken != null) {
      return Get.offAll(const HomePages());
    } else {
      return Get.offAll(LoginPages());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/loading.json'),
      ),
    );
  }
}

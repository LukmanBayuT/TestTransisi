// ignore_for_file: unnecessary_const, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testtrasnsisi/api_services/api_services.dart';

class LoginPages extends StatelessWidget {
  LoginPages({Key? key}) : super(key: key);

  TextEditingController loginCont = TextEditingController();
  TextEditingController passCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(
            child: Text(
              'Sign In Screen',
              style: TextStyle(
                  color: Colors.amber,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            child: Text(
              'untuk masuk gunakan email: eve.holt@reqres.in & password: cityslicka',
              style: TextStyle(
                color: Colors.amber,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: loginCont,
              style: const TextStyle(fontSize: 22),
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: passCont,
              style: const TextStyle(fontSize: 22),
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: Get.size.width / 1.4,
            height: Get.size.height / 13,
            child: ElevatedButton(
              onPressed: () {
                ApiService().loginUser(loginCont.text, passCont.text);
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: const Text(
                'Sign In',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const SizedBox(
            child: const Text(
              'Go to Sign up',
              style: TextStyle(
                  color: Colors.amber,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ]),
      ),
    );
  }
}

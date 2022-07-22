// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testtrasnsisi/api_services/api_services.dart';

class AddPages extends StatelessWidget {
  AddPages({Key? key}) : super(key: key);

  TextEditingController nameCont = TextEditingController();
  TextEditingController emailCont = TextEditingController();
  TextEditingController telpCont = TextEditingController();
  TextEditingController jobCont = TextEditingController();
  TextEditingController siteCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              child: Text(
                'Add User Screen',
                style: TextStyle(
                    color: Colors.amber,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              child: Text(
                'create a new user with new job and new life',
                style: TextStyle(
                  color: Colors.amber,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: nameCont,
                style: const TextStyle(fontSize: 22),
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: jobCont,
                style: const TextStyle(fontSize: 22),
                decoration: const InputDecoration(
                  labelText: 'Job',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                controller: telpCont,
                style: const TextStyle(fontSize: 22),
                decoration: const InputDecoration(
                  labelText: 'Phone',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailCont,
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
                controller: siteCont,
                style: const TextStyle(fontSize: 22),
                decoration: const InputDecoration(
                  labelText: 'Site',
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
                  ApiService().postUser(
                    nameCont.text,
                    jobCont.text,
                    telpCont.text,
                    emailCont.text,
                    siteCont.text,
                  );
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
          ],
        ),
      ),
    );
  }
}

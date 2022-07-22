// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testtrasnsisi/api_services/api_services.dart';

// ignore: must_be_immutable
class DetailsPage extends StatelessWidget {
  DetailsPage({Key? key, required this.id}) : super(key: key);

  int? id;

  @override
  Widget build(BuildContext context) {
    print(id);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: ApiService().getDetails(id.toString()),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          var data = snapshot.data;
          if (data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: SizedBox(
                width: Get.width / 1.1,
                height: Get.height / 1.5,
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          child: ClipOval(
                              child: Image.network(data['data']['avatar']))),
                      Column(
                        children: [
                          const Text(
                            'Email',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            data['data']['email'],
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'First Name',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            data['data']['first_name'],
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Last Name',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            data['data']['last_name'],
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

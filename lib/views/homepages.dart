import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testtrasnsisi/api_services/api_services.dart';
import 'package:testtrasnsisi/views/addpages.dart';
import 'package:testtrasnsisi/views/detail_pages.dart';

class HomePages extends StatelessWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: FloatingActionButton(
          onPressed: () {
            Get.to(() => AddPages());
          },
          backgroundColor: Colors.amber,
          child: const Icon(Icons.add),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: ApiService().getListData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          var data = snapshot.data;
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: Get.size.width / 1.1,
                  height: Get.height / 6,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => DetailsPage(id: data['data'][index]['id']));
                    },
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                                width: 60,
                                height: 60,
                                child: ClipOval(
                                    child: Image.network(
                                        data['data'][index]['avatar']))),
                            Text(data['data'][index]['email'].toString()),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(data['data'][index]['first_name']
                                    .toString()),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(data['data'][index]['last_name']
                                    .toString()),
                              ],
                            ),
                          ],
                        )),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

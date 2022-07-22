import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:testtrasnsisi/views/homepages.dart';

class Finished extends StatefulWidget {
  const Finished({Key? key}) : super(key: key);

  @override
  State<Finished> createState() => _FinishedState();
}

class _FinishedState extends State<Finished> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: (loading == false)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.check_circle_outline_rounded,
                    size: 300,
                    color: Colors.amber,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: Get.width / 1.2,
                    height: Get.height / 8,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.amber,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () {
                          loading = true;
                          setState(() {});
                          Get.offAll(() => const HomePages());
                        },
                        child: const Text('Kembali Ke Menu Utama')),
                  )
                ],
              )
            : Center(
                child: Lottie.asset('assets/loading.json'),
              ),
      ),
    );
  }
}

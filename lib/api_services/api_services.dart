// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:testtrasnsisi/api_services/securestorage.dart';
import 'package:http/http.dart' as http;
import 'package:testtrasnsisi/views/finished_pages.dart';
import 'package:testtrasnsisi/views/homepages.dart';

class ApiService {
  SecureStorage secureStorage = SecureStorage();
  Future loginUser(String email, password) async {
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var request =
        http.Request('POST', Uri.parse('https://reqres.in/api/register'));
    request.bodyFields = {
      'email': email,
      'password': password,
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var data = await response.stream.bytesToString();
    var authData = jsonDecode(data);
    var authToken = authData['token'];
    if (response.statusCode == 200) {
      secureStorage.writeSecureData('authToken', authToken);
      Get.offAll(() => const HomePages());
    } else {
      Get.snackbar('Bad Request', response.reasonPhrase!);
    }
    return authData;
  }

  Future getListData() async {
    var request =
        http.Request('GET', Uri.parse('https://reqres.in/api/users?page=2'));

    http.StreamedResponse response = await request.send();
    var data = await response.stream.bytesToString();
    var details = jsonDecode(data);

    if (response.statusCode == 200) {
      print(details);
    } else {
      print(response.reasonPhrase);
    }
    return jsonDecode(data);
  }

  Future getDetails(String id) async {
    var request =
        http.Request('GET', Uri.parse('https://reqres.in/api/users/$id'));

    http.StreamedResponse response = await request.send();

    var data = await response.stream.bytesToString();
    var details = jsonDecode(data);

    if (response.statusCode == 200) {
      print(details);
    } else {
      print(response.reasonPhrase);
    }
    return jsonDecode(data);
  }

  Future postUser(String name, job, telp, email, site) async {
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var request =
        http.Request('POST', Uri.parse('https://reqres.in/api/users'));
    request.bodyFields = {
      'name': name,
      'job': job,
      'telp': telp,
      'email': email,
      'site': site
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var data = await response.stream.bytesToString();
    var details = jsonDecode(data);

    if (response.statusCode == 200) {
      print(details);
      Get.to(() => Finished());
    } else {
      print(response.reasonPhrase);
      Get.to(() => Finished());
    }
    return jsonDecode(data);
  }
}

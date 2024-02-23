import 'dart:convert';
import 'dart:developer';

import 'package:farmduino/constants/constants.dart';
import 'package:farmduino/constants/variables.dart';
import 'package:http/http.dart' as http;

class Logic {
  Future<List> getData() async {
    final request = await http.get(
        Uri.parse(
          '$httpUrl/user-data',
        ),
        headers: {'Authorization': Variables.token});
    if (request.statusCode == 200) {
      log('success');
      List data = json.decode(request.body);
      return data;
    } else {
      log('fail');
      log(request.body);
      return [];
    }
  }
}

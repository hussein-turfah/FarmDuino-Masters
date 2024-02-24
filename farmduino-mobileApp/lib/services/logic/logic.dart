import 'dart:convert';
import 'dart:developer';

import 'package:farmduino/constants/constants.dart';
import 'package:farmduino/constants/variables.dart';
import 'package:http/http.dart' as http;

class Logic {
  Future<List> getData() async {
    final respose = await http.get(
        Uri.parse(
          '$httpUrl/user-data',
        ),
        headers: {'Authorization': Variables.token});
    if (respose.statusCode == 200) {
      log('success');
      List data = json.decode(respose.body);
      return data;
    } else {
      log('fail');
      log(respose.body);
      return [];
    }
  }

  Future<List> getWeather() async {
    final respose = await http.get(
      Uri.parse('$httpUrl/weather'),
      headers: {
        'Authorization': Variables.token,
      },
    );
    if (respose.statusCode == 200) {
      return json.decode(respose.body);
    } else {
      return [];
    }
  }
}

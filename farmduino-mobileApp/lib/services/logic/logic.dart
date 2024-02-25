import 'dart:convert';
import 'dart:developer';
import 'package:farmduino/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Logic {
  Future<List> getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final respose = await http.get(
        Uri.parse(
          '$httpUrl/user-data',
        ),
        headers: {'Authorization': prefs.getString('name')!});
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
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final respose = await http.get(
      Uri.parse('$httpUrl/weather'),
      headers: {
        'Authorization': prefs.getString('name')!,
      },
    );
    if (respose.statusCode == 200) {
      return json.decode(respose.body);
    } else {
      return [];
    }
  }
}

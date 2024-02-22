import 'dart:convert';
import 'dart:developer';
import 'package:farmduino/constants/constants.dart';
import 'package:http/http.dart' as http;

class Authentication {
  Future<void> register({
    required String fName,
    required String lName,
    required String email,
    required String password,
    required String dateOfBirth,
    required String favoriteColor,
    required String plantName,
  }) async {
    final request = await http.post(
      Uri.parse(
        '$httpUrl/register',
      ),
      body: {
        "first_name": fName,
        "last_name": lName,
        "email": email,
        "password": password,
        "dob": dateOfBirth,
        "favorite_color": favoriteColor,
        "plant_name": plantName,
      },
    );
    final responseBody = jsonDecode(request.body);
    if (request.statusCode == 200 && responseBody['success'] == true) {
      log('success');
    } else {
      log('${request.statusCode}');
    }
  }

  Future<Map> login({
    required String email,
    required String password,
  }) async {
    final request = await http.post(Uri.parse('$httpUrl/login'), body: {
      "email": email,
      "password": password,
    });
    final responseBody = jsonDecode(request.body);
    if (request.statusCode == 200 && responseBody['error'] == null) {
      log('succesul login');
      log(request.body);
      return {
        "success": true,
        "body": jsonDecode(request.body),
      };
    } else {
      log('There was a problem with stautes code: ${request.body}');
      return {
        "success": false,
        "body": jsonDecode(request.body.toString()),
      };
    }
  }
}

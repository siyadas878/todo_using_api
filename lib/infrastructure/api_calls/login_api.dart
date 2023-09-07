import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todo_api/screens/home.dart';

Future<String> loginUser(
    BuildContext context, String email, String password) async {
  String apiUrl = "http://10.0.2.2:8000/api/login/";

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type':
            'application/json', 
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      log(response.body.toString());
      final responseData = jsonDecode(response.body) as Map<String, dynamic>;
      final String token = responseData['Authorization'];
      log(token);
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Home(token: token,email: email),
        ),
      );

      return token;
    } else {
      throw Exception('Failed to login');
    }
  } catch (e) {
    log('-----------$e');
    throw Exception('An error occurred during login');
  }
}

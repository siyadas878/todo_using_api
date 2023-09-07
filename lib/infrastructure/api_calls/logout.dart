import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todo_api/screens/login.dart';

Future<void> logout(BuildContext context, String token) async {
   String url = 'http://10.0.2.2:8000/api/logout/';

  try {
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': token
      },
    );

    if (response.statusCode == 200) {
      log('Response data: ${response.body}');
    } else {
      log('Request failed with status: ${response.statusCode}');
    }
    // ignore: use_build_context_synchronously
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
        (route) => false);
  } catch (error) {
    log('Error occurred: $error');
  }
}

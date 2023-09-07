import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> signup(BuildContext context, String email, String number,
    String name, String password) async {
  String apiUrl = "http://10.0.2.2:8000/api/signup/";

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json', 
      },
      body: jsonEncode({
        'email': email,
        'contact_number': number,
        'first_name': name,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      log('Post added successfully');
      log('Response body: ${response.body}');
    } else if (response.statusCode == 401) {
      log('Authentication error: ${response.body}');
      throw Exception('Authentication error');
    } else {
      log('Failed to add. Status code: ${response.statusCode}');
      log('Response body: ${response.body}');
      throw Exception('Failed to add');
    }
  } catch (e) {
    log('Error during adding: $e');
    throw Exception('An error occurred during adding');
  }
}

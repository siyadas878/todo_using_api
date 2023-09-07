import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> addPost(BuildContext context, String email, String task,
    String taskdetails, String date, String time, String token) async {
  String apiUrl = "http://10.0.2.2:8000/api/addtask/";

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Authorization': token,
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'task': task,
        'task_details': taskdetails,
        'task_due_date': date,
        'task_due_time': time,
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

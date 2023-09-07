import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> deletetask(BuildContext context, String email, int taskId, String token) async {
  String apiUrl = "http://10.0.2.2:8000/api/deletetask/$taskId";

  try {
    final response = await http.delete(
      Uri.parse(apiUrl),
      headers: {'Authorization': token},
      body: jsonEncode(<String, dynamic>{
        'email': email,
        'task_id': taskId,
      }),
    );

    if (response.statusCode == 204) {
      log('Task deleted successfully');
    } else if (response.statusCode == 401) {
      log('Authentication error: ${response.body}');
      throw Exception('Authentication error');
    } else {
      log('successfully deleted. Status code: ${response.statusCode}');
      log('Response body: ${response.body}');
      throw Exception('sucess to delete');
    }
  } catch (e) {
    log('Error during deletion: $e');
    throw Exception('An error occurred during delete');
  }
}

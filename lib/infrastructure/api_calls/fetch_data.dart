import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../../domain/fetch_data/fetch_data.dart';

Future<List<FetchData>> fetchData(String token) async {
   String url = 'http://10.0.2.2:8000/api/task_list_all/';

  final response = await http.get(
    Uri.parse(url),
    headers: {'Authorization': token},
  );

  if (response.statusCode == 200) {
    log('Response data: ${response.body}');
    final List<dynamic> jsonData = jsonDecode(response.body);
    final List<FetchData> resultList =
        jsonData.map((data) => FetchData.fromJson(data)).toList();
    return resultList;
  } else {
    log('Request failed with status: ${response.statusCode}');
  }
  return [];
}

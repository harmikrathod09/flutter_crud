import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseurl =
      "https://67c94c000acf98d070899d14.mockapi.io/userLab";

  Future<List<Map<String, dynamic>>> getUser() async {
    final response = await http.get(Uri.parse("$baseurl"));
    return List<Map<String, dynamic>>.from(json.decode(response.body));
  }

  Future<bool> insertUser(Map<String, dynamic> user) async {
    final response = await http.post(
      Uri.parse(baseurl),
      headers: {"Content-Type": "application/json"},
      body: json.encode(user),
    );

    return response.statusCode ==201;
  }

  Future<bool> updateUser(String id, Map<String, dynamic> user) async {
    final response = await http.put(
      Uri.parse("$baseurl/$id"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(user),
    );

    return response.statusCode ==201;
  }

  Future<bool> deleteUser(String id) async {
    final response = await http.delete(
      Uri.parse("$baseurl/$id"),
    );

    return response.statusCode ==201;
  }
}

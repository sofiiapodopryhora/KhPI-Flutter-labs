import 'dart:convert';
import 'package:http/http.dart' as http;

class GitHubService {
  final String baseUrl = 'https://api.github.com/users';

  Future<Map<String, dynamic>> fetchUser(String username) async {
    final uri = Uri.parse('$baseUrl/$username');
    final resp = await http.get(uri);
    if (resp.statusCode == 200) {
      return json.decode(resp.body) as Map<String, dynamic>;
    } else {
      throw Exception('GitHub API error: ${resp.statusCode}');
    }
  }
}
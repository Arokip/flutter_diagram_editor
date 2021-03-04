import 'dart:convert';

import 'package:http/http.dart' as http;

class EtlHttp {
  Future<String> getJson(String unencodedPath) async {
    // String baseUrl = '192.168.97.108:3000';
    String baseUrl = 'demo.etl.linkedpipes.com';

    final response = await http.get(
      Uri.https(
        baseUrl,
        unencodedPath,
      ),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
    );

    if (response.statusCode == 200) {
      return Utf8Decoder().convert(response.bodyBytes);
    } else {
      throw Exception('Failed to load json');
    }
  }
}

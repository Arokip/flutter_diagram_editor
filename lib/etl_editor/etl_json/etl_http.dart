import 'package:http/http.dart' as http;

class EtlHttp {
  Future<String> getJson(String unencodedPath) async {
    try {
      String baseUrl = '192.168.97.108:3000';
      // String baseUrl = 'demo.etl.linkedpipes.com';

      final response = await http.get(Uri.http(
        baseUrl,
        unencodedPath,
      ));

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to load json');
      }
    } catch (e) {
      print(e);
    }
  }
}

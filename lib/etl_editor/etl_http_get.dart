import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class EtlHttpGet {
  // '1611664269714'
  // Future<http.Response> fetchPipeline(String pipelineString) {
  //   return http.get(Uri.https(
  //       'demo.etl.linkedpipes.com', 'resources/pipelines/$pipelineString'));
  // }

  Future<String> fetchPipeline(String url) async {
    Dio dio = new Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    Response response = await dio.get(url);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // return (jsonDecode(response.data) as List)
      //     .map((pip) => EtlJsonLDGraph.fromJson(pip));
      return response.data.toString();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load data');
    }
  }

  // Future<List<EtlJsonLDGraph>> fetchAlbum() async {
  //   final response =
  //       await http.get('https://jsonplaceholder.typicode.com/albums/1');
  //
  //   if (response.statusCode == 200) {
  //     // If the server did return a 200 OK response,
  //     // then parse the JSON.
  //     return (jsonDecode(response.body) as List)
  //         .map((pip) => EtlJsonLDGraph.fromJson(pip));
  //   } else {
  //     // If the server did not return a 200 OK response,
  //     // then throw an exception.
  //     throw Exception('Failed to load album');
  //   }
  // }
}

class EtlJsonLDGraph {
  final String graph;

  EtlJsonLDGraph({this.graph});

  factory EtlJsonLDGraph.fromJson(Map<String, dynamic> json) {
    return EtlJsonLDGraph(
      graph: json['@graph'],
    );
  }
}

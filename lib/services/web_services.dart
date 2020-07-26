import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_provider_demo/models/News.dart';

class WebServices {
  static String get _apiKey => "97736120a22a45a49a08dbb770f029bd";

  static Future<List<News>> get fetchTopHeadLines async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=tr&apiKey=$_apiKey";

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable json = body["articles"];
      return json.map((_new) => News.fromJson(_new)).toList();
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}

import 'dart:convert';
import 'package:flutter_provider_demo/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_provider_demo/models/News.dart';

class WebServices {
  

  static Future<List<News>> get fetchTopHeadLines async {
    

    final response = await http.get(Constants.topHeadlinesURL);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable json = body["articles"];
      return json.map((_new) => News.fromJson(_new)).toList();
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}

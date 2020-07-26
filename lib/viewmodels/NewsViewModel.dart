import 'package:flutter/cupertino.dart';
import 'package:flutter_provider_demo/models/News.dart';
import 'package:flutter_provider_demo/services/web_services.dart';

class NewsViewModel extends ChangeNotifier {
  NewsViewModel() {
    this.fetchTopHeadLines();
  }

  List<News> listNews = [];

  Future<void> fetchTopHeadLines() async {
    final result = await WebServices.fetchTopHeadLines;
    this.listNews = result.map((item) => item).toList();
    notifyListeners();
  }
}

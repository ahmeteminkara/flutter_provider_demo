import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_provider_demo/models/News.dart';
import 'package:flutter_provider_demo/services/web_services.dart';
import 'package:flutter_provider_demo/utils/enums.dart';

class NewsViewModel extends ChangeNotifier {
  EnumNewsRequestStatus requestStatus = EnumNewsRequestStatus.NONE;

  List<News> listNews = [];

  Future<void> fetchTopHeadLines() async {
    requestStatus = EnumNewsRequestStatus.LOADING;
    notifyListeners();

    await new Future.delayed(const Duration(seconds: 5));

    final result = await WebServices.fetchTopHeadLines;

    this.listNews = result.map((item) => item).toList();

    requestStatus = EnumNewsRequestStatus.SUCCESS;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_provider_demo/viewmodels/NewsViewModel.dart';
import 'package:flutter_provider_demo/widgets/appbar_theme_changer_button.dart';
import 'package:flutter_provider_demo/widgets/news_list_item.dart';
import 'package:provider/provider.dart';

class NewsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NewsViewModel news = Provider.of<NewsViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Güncel Haberler"),
        actions: <Widget>[
          AppBarThemeChangerButton(),
        ],
      ),
      body: NewsListItem(listNews: news.listNews),
    );
  }
}

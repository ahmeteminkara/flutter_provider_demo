import 'package:flutter/material.dart';
import 'package:flutter_provider_demo/utils/enums.dart';
import 'package:flutter_provider_demo/viewmodels/NewsViewModel.dart';
import 'package:flutter_provider_demo/widgets/appbar_theme_changer_button.dart';
import 'package:flutter_provider_demo/widgets/message_box_card.dart';
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
      body: body(news),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          news.fetchTopHeadLines();
        },
      ),
    );
  }

  body(NewsViewModel news) {
    if (news.requestStatus == EnumNewsRequestStatus.NONE) {
      return MessageBoxCard(msg: "Sorgu yapmak için düğmeye tıklayın.");
    } else if (news.requestStatus == EnumNewsRequestStatus.LOADING) {
      return MessageBoxCard(
          msg: "Lütfen bekleyiniz.", type: MessageType.Loaging);
    } else {
      return NewsListItem(listNews: news.listNews);
    }
  }
}

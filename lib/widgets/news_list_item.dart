import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_demo/models/News.dart';
import 'package:flutter_provider_demo/views/NewsDetailView.dart';

class NewsListItem extends StatelessWidget {
  final List<News> listNews;

  NewsListItem({@required this.listNews});

  @override
  Widget build(BuildContext context) {
    return listNews.length == 0
        ? Card(
            elevation: 10,
            child: ListTile(title: Text("Veri bulunamadı.")),
          )
        : ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: listNews.length,
            itemBuilder: (ctx, index) =>
                cardChild(context, listNews.elementAt(index)),
          );
  }

  cardChild(BuildContext context, News news) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => NewsDetailView(news),
            ));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.hardEdge,
        elevation: 12,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Hero(
              tag: news.publishedAt.toString(),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage,
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            ListTile(
              title: Text(news.title),
              subtitle: Text(news.author),
            )
          ],
        ),
      ),
    );
  }
}

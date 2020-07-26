import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_provider_demo/models/News.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

class NewsDetailView extends StatelessWidget {
  final News newsItem;

  const NewsDetailView(this.newsItem);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _fab,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 240.0,
              floating: true,
              pinned: true,
              snap: true,
              flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  title: Text(newsItem.author,
                      style: TextStyle(
                        shadows: [
                          Shadow(blurRadius: 30, offset: Offset(0, 0)),
                        ],
                      )),
                  background: _image),
            ),
          ];
        },
        body: ListView(
          children: <Widget>[
            _title,
            _divider,
            _description,
            _divider,
            _content,
          ],
        ),
      ),
    );
  }

  get _image => Hero(
        tag: newsItem.publishedAt.toString(),
        child: CachedNetworkImage(
          imageUrl: newsItem.urlToImage,
          fit: BoxFit.cover,
          height: 200,
          width: double.infinity,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      );

  get _divider => Divider();

  get _title => ListTile(
        title: Text(
          newsItem.title,
          style: TextStyle(fontSize: 20),
        ),
        subtitle: Text(newsItem.publishedAt),
      );

  get _description => ListTile(
        title: Text(newsItem.description),
      );

  get _content => ListTile(
        title: Text(newsItem.content),
      );

  get _fab => FloatingActionButton(
      child: Icon(Icons.launch), onPressed: () => openBrowser());

  openBrowser() async {
    await FlutterWebBrowser.openWebPage(url: newsItem.url);
  }
}

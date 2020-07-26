import 'package:flutter/material.dart';
import 'package:flutter_provider_demo/models/AppTheme.dart';
import 'package:flutter_provider_demo/viewmodels/NewsViewModel.dart';
import 'package:flutter_provider_demo/viewmodels/ThemeChanger.dart';
import 'package:flutter_provider_demo/views/NewsView.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    child: MyApp(),
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeChanger(AppTheme.light)),
      ChangeNotifierProvider(create: (_) => NewsViewModel()),
    ],
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      title: 'Flutter Provider Demo',
      theme: _themeChanger.appTheme,
      home: NewsView(),
    );
  }
}

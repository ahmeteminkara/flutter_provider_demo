import 'package:flutter/material.dart';
import 'package:flutter_provider_demo/models/AppTheme.dart';
import 'package:flutter_provider_demo/viewmodels/ThemeChanger.dart';
import 'package:provider/provider.dart';

class ThemeChangerTool extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);

    return ListTile(
      title: Text("Koyu Tema"),
      onTap: () {
        if (_themeChanger.appTheme == AppTheme.dark) {
          _themeChanger.setAppTheme(ThemeData.light());
        } else {
          _themeChanger.setAppTheme(ThemeData.dark());
        }
      },
      trailing: Switch(
          value: _themeChanger.appTheme == AppTheme.dark,
          onChanged: (_) {
            if (_themeChanger.appTheme == AppTheme.dark) {
              _themeChanger.setAppTheme(ThemeData.light());
            } else {
              _themeChanger.setAppTheme(ThemeData.dark());
            }
          }),
    );
  }
}

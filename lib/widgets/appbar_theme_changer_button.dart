import 'package:flutter/material.dart';
import 'package:flutter_provider_demo/models/AppTheme.dart';
import 'package:flutter_provider_demo/viewmodels/ThemeChanger.dart';
import 'package:flutter_provider_demo/widgets/theme_changer_tool.dart';
import 'package:provider/provider.dart';

class AppBarThemeChangerButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeChanger theme = Provider.of<ThemeChanger>(context);

    return IconButton(
        icon: Icon(theme.appTheme == AppTheme.light
            ? Icons.wb_sunny
            : Icons.brightness_2),
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    content: ThemeChangerTool(),
                  ));
        });
  }
}

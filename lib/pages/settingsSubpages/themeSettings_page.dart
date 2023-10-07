// ignore_for_file: file_names

import 'package:baseconverter/main.dart';
import 'package:baseconverter/widgets/default_header.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeSettingsPage extends StatefulWidget {
  const ThemeSettingsPage({super.key});

  @override
  State<ThemeSettingsPage> createState() => _ThemeSettingsPageState();
}

class _ThemeSettingsPageState extends State<ThemeSettingsPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getDeafultHeader(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return ListView(
      children: [
        const Padding(
          padding:  EdgeInsets.all(8.0),
          child: Text("App's theme", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
        ),
        RadioListTile(
          title: const Text("Light theme"),
          value: AppTheme.light,
          groupValue: StaticVariables.appTheme,
          onChanged: (value) async {
            final SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setInt("appTheme", 0);

            if (context.mounted)
            {
              BaseConverterMain.of(context).changeTheme(ThemeMode.light);
            }

            setState(() {
              StaticVariables.appTheme = value!;
            });
          },
          controlAffinity: ListTileControlAffinity.trailing,
        ),
        RadioListTile(
          title: const Text("Dark theme"),
          value: AppTheme.dark,
          groupValue: StaticVariables.appTheme,
          onChanged: (value) async {
            final SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setInt("appTheme", 1);

            if (context.mounted)
            {
              BaseConverterMain.of(context).changeTheme(ThemeMode.dark);
            }

            setState(() {
              StaticVariables.appTheme = value!;
            });
          },
          controlAffinity: ListTileControlAffinity.trailing,
        ),
        RadioListTile(
          title: const Text("System's theme"),
          value: AppTheme.system,
          groupValue: StaticVariables.appTheme,
          onChanged: (value) async {
            final SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setInt("appTheme", 2);

            if (context.mounted)
            {
              BaseConverterMain.of(context).changeTheme(ThemeMode.system);
            }

            setState(() {
              StaticVariables.appTheme = value!;
            });
          },
          controlAffinity: ListTileControlAffinity.trailing,
        ),
      ],
    );
  }
}
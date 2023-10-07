
import 'package:baseconverter/pages/settingsSubpages/themeSettings_page.dart';
import 'package:baseconverter/widgets/default_header.dart';
import 'package:flutter/material.dart';

import 'package:baseconverter/widgets/default_drawer.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: getDrawer(context),
      appBar: getDeafultHeader(),
      body: getBody(),
    );
  }

  void setStateForHeader()
  {
    setState(() { });
  }

  Widget getBody() {
    return ListView(
      children: [
        const Padding( // OVERALL
          padding:  EdgeInsets.all(8.0),
          child: Text("Overall settings", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => 
                const ThemeSettingsPage(),
              )
            );
          },
          child: const ListTile(
            title:  Text("App's theme"),
            trailing: Icon(Icons.arrow_right, size: 36,),
          ),
        ),
      ],
    );
  }
}
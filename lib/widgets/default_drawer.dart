import 'package:baseconverter/pages/home_page.dart';
import 'package:baseconverter/pages/settings_page.dart';
import 'package:flutter/material.dart';

import 'package:baseconverter/main.dart';
import 'package:baseconverter/constants.dart';

Drawer getDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
          const DrawerHeader(
          decoration: BoxDecoration(
            color: BaseConverterPalette.mainColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Base Converter", style: TextStyle(fontSize: 24, color: Colors.white),),
                  Text("© 2023 Ronald L", style: TextStyle(color: Color.fromARGB(80, 39, 37, 37), fontSize: 12)),
                ],
              ),
            ],
          ),
        ),
        ListTile(
          title: const Text("Home"),
          trailing: const Icon(Icons.home),
          onTap: () async {
            if(StaticVariables.pageIndex == 0)
            {
              Navigator.of(context).pop();
        
              return;
            }
        
            StaticVariables.pageIndex = 0;
        
            if (context.mounted)
            {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => 
                    const HomePage(),
                )
              );
            }
          },
        ),

        ListTile(
          title: const Text("Settings"),
          trailing: const Icon(Icons.settings),
          onTap: () async {
            if(StaticVariables.pageIndex == 1)
            {
              Navigator.of(context).pop();

              return;
            }

            StaticVariables.pageIndex = 1;

            if (context.mounted)
            {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => 
                    const SettingsPage(),
                )
              );
            }
          },
        ), 
      ],
    ),
  );
}
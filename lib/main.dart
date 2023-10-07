import 'dart:developer';

import 'package:baseconverter/constants.dart';
import 'package:baseconverter/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppTheme { light, dark, system }

class StaticVariables {
  static int pageIndex = 0;
  static AppTheme appTheme = AppTheme.system;
  static SharedPreferences? baseConverterSharedPrefs;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  StaticVariables.baseConverterSharedPrefs = await SharedPreferences.getInstance();

  inspect(StaticVariables.baseConverterSharedPrefs);

  if (!StaticVariables.baseConverterSharedPrefs!.containsKey("appTheme")) 
  {
    StaticVariables.baseConverterSharedPrefs!.setInt("appTheme", 2);
  }

  runApp(const BaseConverterMain());
}

class BaseConverterMain extends StatefulWidget {
  const BaseConverterMain({super.key});

  @override
  State<BaseConverterMain> createState() => _BaseConverterMainState();

  static _BaseConverterMainState of(BuildContext context) => context.findAncestorStateOfType<_BaseConverterMainState>()!;
}

class _BaseConverterMainState extends State<BaseConverterMain> {
  ThemeMode _themeMode = ThemeMode.system;

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  void initState() {
    super.initState();

    switch (StaticVariables.baseConverterSharedPrefs!.getInt("appTheme")) {
      case 0:
        _themeMode = ThemeMode.light;
        StaticVariables.appTheme = AppTheme.light;
        break;
      case 1:
        _themeMode = ThemeMode.dark;
        StaticVariables.appTheme = AppTheme.dark;
        break;
      case 2:
        _themeMode = ThemeMode.system;
        StaticVariables.appTheme = AppTheme.system;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Base Converter',
      theme: ThemeData(
        scaffoldBackgroundColor:Colors.white,
        primaryColor: BaseConverterPalette.mainColor,
        primarySwatch: BaseConverterPalette.mainColor,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(BaseConverterPalette.mainColor),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            overlayColor: MaterialStateProperty.resolveWith((states) => BaseConverterPalette.mainColor.shade300)
          )
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Colors.white
        ),
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
        primaryIconTheme: const IconThemeData(
          color: Colors.black
        ),
        listTileTheme: const ListTileThemeData(
          iconColor: Colors.black
        ),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.black)
        ),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all(BaseConverterPalette.mainColor),
          trackColor: MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.selected) ? BaseConverterPalette.mainColor.shade200 : null),
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.all(BaseConverterPalette.mainColor)
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: BaseConverterPalette.mainColor,
          foregroundColor: Colors.black,
        ),
      ),   
      darkTheme: ThemeData(
        scaffoldBackgroundColor:Colors.black,
        primarySwatch: BaseConverterPalette.mainColor,
        primaryTextTheme: const TextTheme(
          bodySmall: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          bodyLarge: TextStyle(color: Colors.white),
        ),
        textTheme: const TextTheme(
          bodySmall: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          bodyLarge: TextStyle(color: Colors.white),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(BaseConverterPalette.mainColor),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            overlayColor: MaterialStateProperty.resolveWith((states) => BaseConverterPalette.mainColor.shade300)
          )
        ),
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.white
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Color.fromARGB(255, 20, 20, 20)
        ),
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
        primaryIconTheme: const IconThemeData(
          color: Colors.white
        ),
        listTileTheme: const ListTileThemeData(
          iconColor: Colors.white,
          textColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.white)
        ),
        cardTheme: const CardTheme(
          color: Color.fromARGB(3, 255, 255, 255),
          shadowColor: Color.fromARGB(120, 255, 255, 255)
        ),
        dividerColor: const Color.fromARGB(120, 255, 255, 255),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all(BaseConverterPalette.mainColor),
          trackColor: MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.selected) ? const Color.fromARGB(255, 24, 114, 55) : BaseConverterPalette.mainColor.shade600),
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.all(BaseConverterPalette.mainColor)
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: BaseConverterPalette.mainColor,
          foregroundColor: Colors.white
        ),
      ),
      themeMode: _themeMode,
      home: const HomePage(),
    );
  }
}
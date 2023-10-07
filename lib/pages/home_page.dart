import 'package:baseconverter/main.dart';
import 'package:baseconverter/services/from_binary_conversion.dart';
import 'package:baseconverter/services/from_decimal_conversion.dart';
import 'package:baseconverter/services/from_hex_conversion.dart';
import 'package:baseconverter/services/from_octal_conversion.dart';
import 'package:baseconverter/widgets/default_drawer.dart';
import 'package:baseconverter/widgets/default_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController decimalTextController = TextEditingController();
  TextEditingController binaryTextController = TextEditingController();
  TextEditingController hexadecimalTextController = TextEditingController();
  TextEditingController octalTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getDeafultHeader(),
      body: getBody(),
      drawer: getDrawer(context),
      floatingActionButton: getFloatingActionButton(),
    );
  }

  Widget getBody() {
    bool isDarkMode;

    if (StaticVariables.appTheme == AppTheme.system)
    {
      var brightness = MediaQuery.of(context).platformBrightness;
      isDarkMode = brightness == Brightness.dark;
    }
    else if (StaticVariables.appTheme == AppTheme.dark)
    {
      isDarkMode = true;
    }
    else
    {
      isDarkMode = false;
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: TextField(
                controller: decimalTextController,
                style: isDarkMode ? const TextStyle(color: Colors.white) : const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: "Decimal",
                  labelStyle: isDarkMode ? const TextStyle(color: Color.fromARGB(128, 255, 255, 255)) : const TextStyle(color: Color.fromARGB(128, 0, 0, 0)),
                ),
                onChanged: (value) {
                  if (value == "")
                  {
                    binaryTextController.text = "";
                    hexadecimalTextController.text = "";
                    octalTextController.text = "";

                    return;
                  }

                  if (value == "0")
                  {
                    binaryTextController.text = "0";
                    hexadecimalTextController.text = "0";
                    octalTextController.text = "0";

                    return;
                  }

                  binaryTextController.text = FromDecimalConversion.decToBin(double.parse(value));
                  hexadecimalTextController.text = FromDecimalConversion.decToHex(double.parse(value));
                  octalTextController.text = FromDecimalConversion.decToOct(double.parse(value));
                },
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: TextField(
                controller: binaryTextController,
                style: isDarkMode ? const TextStyle(color: Colors.white) : const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: "Binary",
                  labelStyle: isDarkMode ? const TextStyle(color: Color.fromARGB(128, 255, 255, 255)) : const TextStyle(color: Color.fromARGB(128, 0, 0, 0)),
                ),
                onChanged: (value) {
                  if (value == "")
                  {
                    decimalTextController.text = "";
                    hexadecimalTextController.text = "";
                    octalTextController.text = "";

                    return;
                  }

                  if (double.parse(value) == 0)
                  {
                    decimalTextController.text = "0";
                    hexadecimalTextController.text = "0";
                    octalTextController.text = "0";

                    return;
                  }

                  String decValue = FromBinaryConversion.binToDec(value);
                  decimalTextController.text = decValue;
                  hexadecimalTextController.text = FromDecimalConversion.decToHex(double.parse(decValue));
                  octalTextController.text = FromDecimalConversion.decToOct(double.parse(decValue));
                },
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-1.]')),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: TextField(
                controller: hexadecimalTextController,
                style: isDarkMode ? const TextStyle(color: Colors.white) : const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: "Hexadecimal",
                  labelStyle: isDarkMode ? const TextStyle(color: Color.fromARGB(128, 255, 255, 255)) : const TextStyle(color: Color.fromARGB(128, 0, 0, 0)),
                ),
                onChanged: (value) {
                  if (value == "")
                  {
                    decimalTextController.text = "";
                    binaryTextController.text = "";
                    octalTextController.text = "";

                    return;
                  }

                  if (double.tryParse(value) != null && double.parse(value) == 0)
                  {
                    decimalTextController.text = "0";
                    binaryTextController.text = "0";
                    octalTextController.text = "0";

                    return;
                  }

                  String decValue = FromHexConversion.hexToDec(value);
                  decimalTextController.text = decValue;
                  binaryTextController.text = FromDecimalConversion.decToBin(double.parse(decValue));
                  octalTextController.text = FromDecimalConversion.decToOct(double.parse(decValue));
                },
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-fA-F0-9.]')),
                  UpperCaseTextFormatter(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: TextField(
                controller: octalTextController,
                style: isDarkMode ? const TextStyle(color: Colors.white) : const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: "Octal",
                  labelStyle: isDarkMode ? const TextStyle(color: Color.fromARGB(128, 255, 255, 255)) : const TextStyle(color: Color.fromARGB(128, 0, 0, 0)),
                ),
                onChanged: (value) {
                  if (value == "")
                  {
                    decimalTextController.text = "";
                    binaryTextController.text = "";
                    hexadecimalTextController.text = "";

                    return;
                  }

                  if (double.parse(value) == 0)
                  {
                    decimalTextController.text = "0";
                    binaryTextController.text = "0";
                    hexadecimalTextController.text = "0";

                    return;
                  }

                  String decValue = FromOctalConversion.octToDec(value);
                  decimalTextController.text = decValue;
                  binaryTextController.text = FromDecimalConversion.decToBin(double.parse(decValue));
                  hexadecimalTextController.text = FromDecimalConversion.decToHex(double.parse(decValue));
                },
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-7.]')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  FloatingActionButton getFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        decimalTextController.clear();
        binaryTextController.clear();
        hexadecimalTextController.clear();
        octalTextController.clear();
      },
      tooltip: "Clear",
      child: const Icon(Icons.clear),
    );
  }

}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
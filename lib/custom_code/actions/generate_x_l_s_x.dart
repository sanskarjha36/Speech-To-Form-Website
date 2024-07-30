// Automatic FlutterFlow imports
import '/flutter_files/flutter_files_theme.dart';
import '/flutter_files/flutter_files_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_files/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'dart:convert'; // For utf8.encode
import 'dart:html' as html;
import 'dart:typed_data'; // Needed for Uint8List
import 'package:excel/excel.dart';

// Function to create an Excel file and trigger a download in web
Future<void> generateXLSX(List<String>? totallist) async {
  if (totallist == null || totallist.isEmpty) {
    print('No data provided.');
    return;
  }

  // Create a new Excel workbook
  var excel = Excel.createExcel();

  // Create a new sheet in the workbook
  var sheet = excel['Sheet1'];

  // Add headers to the sheet
  sheet.appendRow(['A1']);

  // Add data to the sheet
  for (var i = 0; i < totallist.length; i++) {
    var data = totallist[i].split(',');
    sheet.appendRow(data);
  }

  // Convert the Excel file to a byte array
  List<int> bytes = excel.encode() ?? [];
  final base64Str = base64Encode(bytes);
  final url =
      "data:application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;base64,$base64Str";

  // Create a download link and trigger it
  final anchor = html.AnchorElement(href: url)
    ..setAttribute("download", "Text To Speech DATASHEET.xlsx")
    ..click();

  print('Excel file download triggered.');
}

import 'dart:io';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart';


class pdfApi{
  // static Future<File> generateCenteredText(String text) async{
  //   final pdf = pw.Document();
  //
  //   pdf.addPage(pw.Page(
  //     build: (context) => pw.Center(
  //       child: pw.Text(text, style: pw.TextStyle(fontSize: 48) )
  //     )
  //   ));
  //   return saveDocument(name: 'firstGenerate.pdf', pdf: pdf);
  // }

  //Menyimpan Dokumen .pdf
  static Future<File> saveDocument({String name, pw.Document pdf,}) async{
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  //Membuka Dokumen .pdf
  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
    debugPrint(url);
  }

}
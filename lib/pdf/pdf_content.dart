import 'dart:io';
import 'package:generatepdf/pdf/pdf_api.dart';
import 'package:pdf/widgets.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';

class PdfContent {
  static Future<File> generate(contentTable, tgl, sign) async{
    final pdf = Document();
    final List content = contentTable;
    final esign = sign;
    final data = content.map((content) => [content.label, content.input, content.label2, content.input2]).toList();
    final image = MemoryImage(File(esign).readAsBytesSync());

    pdf.addPage(
      MultiPage(
        build: (context) => <Widget>[
        buildHeadline(),//Headline untuk PDF
        buildBorder(0),//Border atas
        Table.fromTextArray(
            data: data,
            border: null,
            cellAlignment: Alignment.centerLeft),
          buildBorder(20.0),//Border bawah
        SizedBox(height: 20),
        Container(
          child: Align(
            alignment: Alignment.topRight,
              child: Column(
                  children: [
                    Text('Jakarta, ${tgl}'),
                    Image(image, width: 60, height: 60),
                    Text('_______________'),
                  ]
              )
          ),

        ) // Center
      ],
      ),
    );

    return pdfApi.saveDocument(name: 'generateData.pdf', pdf: pdf);
  }

  static Widget buildHeadline() => Header(
    child: Text(
      'Data HR',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: PdfColors.white,
      ),
    ),
    decoration: BoxDecoration(color: PdfColors.blue)
  );

  static Widget buildBorder(double padding) => Container(
    padding: EdgeInsets.only(top:padding),
      decoration: BoxDecoration( border: Border(bottom: BorderSide(width: 2, color: PdfColors.black)) )
  );

}
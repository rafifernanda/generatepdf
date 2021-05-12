import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mailer/flutter_mailer.dart';
import 'package:generatepdf/pdf/pdf_content.dart';
import 'package:url_launcher/url_launcher.dart';
import '../pdf/pdf_api.dart';

class CheckFile extends StatefulWidget {
  final contentTable;
  final tgl;
  final email;
  const CheckFile({this.contentTable, this.tgl, this.email, Key key}) : super(key: key);

  @override
  _CheckFileState createState() => _CheckFileState();
}

class _CheckFileState extends State<CheckFile> {
  String sign;
  _refreshAction() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => super.widget));
  }

  //Mengecek keberadaan file e-sign di dalam folder device
  Future getFile() async {
    final path = '/storage/emulated/0/Download/signature.png';
    if (await File(path).exists()) {
      setState(() {
        sign = '/storage/emulated/0/Download/signature.png';
        print("File exists");
      });
    } else {
      setState(() {
        print("File don't exists");
        sign = null;
      });
    }
    return sign;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getFile();
  }


  @override
  Widget build(BuildContext context) {
    var table = widget.contentTable;
    var tanggal = widget.tgl;
    var emailSales = widget.email;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(40, 80, 40, 10),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(top: 5, bottom: 5),
                width: 140,
                height: 140,
                color: Colors.white10,
                child: Column(
                  children: [
                    Icon(Icons.picture_as_pdf, size: 36, color: Colors.blue,),
                    Text('generate.pdf'),
                  ],
                )
            ),
            showSign(sign),
            FloatingActionButton(
              onPressed: _refreshAction,
              tooltip: 'Refresh',
              child: new Icon(Icons.refresh),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60, right: 60, top: 40),
              child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text('Submit'),
                  onPressed: () async{

                    //Generate data list ke dalam pdf
                    final pdfFile = await PdfContent.generate(table, tanggal, sign);
                    // pdfApi.openFile(pdfFile);

                    // Mengarah ke email mencatumkan attachment
                    final MailOptions mailOptions = MailOptions(
                      body: 'https://www.docsketch.com/online-signature/draw/',
                      subject: 'HR data',
                      recipients: [emailSales],
                      isHTML: true,
                      bccRecipients: [''],
                      ccRecipients: [''],
                      attachments: [ '/data/user/0/com.rafi.generatepdf/app_flutter/generateData.pdf', ],
                      // attachments: [ '/storage/emulated/0/Download/signature.png', ],
                    );

                    String platformResponse;

                    final MailerResponse response = await FlutterMailer.send(mailOptions);
                    switch (response) {
                      case MailerResponse.saved: /// ios only
                        platformResponse = 'mail was saved to draft';
                        break;
                      case MailerResponse.sent: /// ios only
                        platformResponse = 'mail was sent';
                        break;
                      case MailerResponse.cancelled: /// ios only
                        platformResponse = 'mail was cancelled';
                        break;
                      case MailerResponse.android:
                        platformResponse = 'intent was successful';
                        break;
                      default:
                        platformResponse = 'unknown';
                        break;
                    }
                }
              ),
            ),
          ],
        ),

      ),
    );
  }

  //Method untuk menampilkan e-sign ke dalam screen
  static Widget showSign(sign){
  if (sign != null) {
    print(sign);
      return Container(
          width: 140,
          height: 140,
          child: Image.file(File('/storage/emulated/0/Download/signature.png'))
      );
    }else{
    print(sign);
      return Padding(
        padding: const EdgeInsets.all(40),
        child: GestureDetector(
          onTap: (){
            esign();
          },
          child: Container(
            width: 140,
            height: 160,
            color: Colors.grey,
            child: Center(
              child: Text('E-sign not available\nClick Here!', textAlign: TextAlign.center,),
            ),
          ),
        ),
      );
    }
  }
}

//Method untuk mengarahkan ke web e-sign
void esign() {
  Future<void> _launched;
  const String toLaunch = 'https://www.docsketch.com/online-signature/draw/';
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
  _launched = _launchInBrowser(toLaunch);
}

// Copyright 2021 by Rafi-dev. All rights reserved.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generatepdf/page/checkfile.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:generatepdf/page/splashscreen.dart';
import 'package:generatepdf/utils/textform.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:generatepdf/model/model.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class Generate extends StatefulWidget {
  @override
  _GenerateState createState() => _GenerateState();
}

class _GenerateState extends State<Generate> {
  bool isVeryBold=false;
  Future<void> _launched;
  TextEditingController nomorController = TextEditingController();
  TextEditingController tanggalController = TextEditingController();
  TextEditingController namaptController = TextEditingController();
  TextEditingController npwpController = TextEditingController();
  TextEditingController picUserController = TextEditingController();
  TextEditingController picPositionController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController totalEmpController = TextEditingController();
  TextEditingController keterangan1Controller = TextEditingController();
  TextEditingController hargaTraining = TextEditingController();
  TextEditingController keterangan2Controller = TextEditingController();
  TextEditingController hargaImplementasi = TextEditingController();
  TextEditingController keterangan3Controller = TextEditingController();
  TextEditingController hargaModifikasi = TextEditingController();
  TextEditingController keterangan4Controller = TextEditingController();
  TextEditingController emailSalesController = TextEditingController();
  TextEditingController billingPIC = TextEditingController();
  TextEditingController billingAddress = TextEditingController();
  TextEditingController billingContact = TextEditingController();
  TextEditingController billingEmail = TextEditingController();
  var diskonController = new MoneyMaskedTextController(decimalSeparator: '.');
  var diskonTraining = new MoneyMaskedTextController(decimalSeparator: '.');
  var diskonImplementasi = new MoneyMaskedTextController(decimalSeparator: '.');
  var diskonModifikasi = new MoneyMaskedTextController(decimalSeparator: '.');
  var hargaRibuan = new MoneyMaskedTextController(thousandSeparator: '.');
  var perKaryawanRibuan = new MoneyMaskedTextController(thousandSeparator: '.');
  var setelahDiskonRibuan = new MoneyMaskedTextController(thousandSeparator: '.');
  var hargaTrainingRibuan = new MoneyMaskedTextController(thousandSeparator: '.');
  var totTrainingRibuan = new MoneyMaskedTextController(thousandSeparator: '.');
  var hargaImplementasiRibuan = new MoneyMaskedTextController(thousandSeparator: '.');
  var totImplementasiRibuan = new MoneyMaskedTextController(thousandSeparator: '.');
  var hargaModifikasiRibuan = new MoneyMaskedTextController(thousandSeparator: '.');
  var totModifikasiRibuan = new MoneyMaskedTextController(thousandSeparator: '.');
  DateTime _selectedDate = DateTime.now();


  @override
  Widget build(BuildContext context) {
    const String toLaunch = 'https://www.docsketch.com/online-signature/draw/';
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yMMMd');
    final String tanggal = formatter.format(now);
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 50),
                ),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text('Generate to PDF',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextForm('Nomor', nomorController),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Row(children: <Widget>[
                    Expanded(child:
                    TextField(
                      controller: tanggalController,
                      onTap: () {
                        //Method untuk Memilih Tanggal
                        _selectDate(context);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Tanggal',
                      ),
                    ),
                    ),
                    SizedBox(width: 10,),
                    IconButton(
                      icon: new Icon(Icons.date_range_rounded),
                      highlightColor: Colors.blue,
                      color: Colors.blue,
                      iconSize: 40,
                      onPressed: (){
                        //Method Ikon untuk Memilih Tanggal
                        _selectDate(context);
                      },
                    ),
                  ],
                  )
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextForm('NamaPT', namaptController)
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextForm('NPWP', npwpController),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
                  child: TextForm('PIC User', picUserController),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextForm('PIC Position', picPositionController),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextForm('Contact', contactController)
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextForm('Email', emailController),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
                  child: TextForm('Billing PIC', billingPIC),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextForm('Billing Address', billingAddress),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextForm('Billing Contact', billingContact)
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextForm('Billing Email', billingEmail),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
                    child: TextForm('Total Employee', totalEmpController)
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Row(
                    children: <Widget>[
                      Expanded(child:NumForm('Diskon', diskonController),),
                      SizedBox(width: 15,),
                      Text("%", style: TextStyle(fontWeight: isVeryBold?FontWeight.w900: FontWeight.w700, fontSize: 35)),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    maxLength: 20,
                    controller: keterangan1Controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Keterangan 1',
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
                    child: TextForm('Harga Training', hargaTraining)
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Row(
                    children: <Widget>[
                      Expanded(child:NumForm('Diskon Training', diskonTraining),),
                      SizedBox(width: 15,),
                      Text("%", style: TextStyle(fontWeight: isVeryBold?FontWeight.w900: FontWeight.w700, fontSize: 35)),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    maxLength: 20,
                    controller: keterangan2Controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Keterangan 2',
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
                    child: TextForm('Harga Implementasi', hargaImplementasi)
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Row(
                    children: <Widget>[
                      Expanded(child:NumForm('Diskon Implementasi', diskonImplementasi),),
                      SizedBox(width: 15,),
                      Text("%", style: TextStyle(fontWeight: isVeryBold?FontWeight.w900: FontWeight.w700, fontSize: 35)),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    maxLength: 20,
                    controller: keterangan3Controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Keterangan 3',
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
                    child: TextForm('Harga Modifikasi', hargaModifikasi)
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Row(
                    children: <Widget>[
                      Expanded(child:NumForm('Diskon Modifikasi', diskonModifikasi),),
                      SizedBox(width: 15,),
                      Text("%", style: TextStyle(fontWeight: isVeryBold?FontWeight.w900: FontWeight.w700, fontSize: 35)),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    maxLength: 20,
                    controller: keterangan4Controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Keterangan 4',
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
                    child: TextForm('Email Sales', emailSalesController)
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Generate English'),
                      onPressed: () async {

                        //Menyimpan email sales ke dalam variabel
                        var emailSales = emailSalesController.text;

                        //Menghitung Harga berdasarkan jumlah karyawan
                        calculate(totalEmpController.text);

                        //Format Tanggal untuk e-sign
                        var tgl = DateFormat.yMMMd().format(_selectedDate);

                        //Jika Keterangan Kosong, maka keterangan tidak muncul
                        String keterangan;
                        String colon;
                        String keterangan2;
                        String colon2;
                        String keterangan3;
                        String colon3;
                        String keterangan4;
                        String colon4;

                        if(keterangan1Controller.text == ''){
                          keterangan = '';
                          colon = '';
                        }else{
                          keterangan = 'Note 1';
                          colon = ':';
                        }

                        if(keterangan2Controller.text == ''){
                          keterangan2 = '';
                          colon2 = '';
                        }else{
                          keterangan2 = 'Note 2';
                          colon2 = ':';
                        }


                        if(keterangan3Controller.text == ''){
                          keterangan3 = '';
                          colon3 = '';
                        }else{
                          keterangan3 = 'Note 3';
                          colon3 = ':';
                        }


                        if(keterangan4Controller.text == ''){
                          keterangan4 = '';
                          colon4 = '';
                        }else{
                          keterangan4 = 'Note 4';
                          colon4 = ':';
                        }

                        //Mengumpulkan data di dalam List
                        final contentTable = [
                          ContentString(label: '', input: '', label2: '', input2: ''),
                          ContentString(label: 'No.', input: ': ${nomorController.text}',label2: '', input2: ''),
                          ContentString(label: 'Date', input: ': ${tanggalController.text}',label2: '', input2: ''),
                          ContentString(label: 'Company Name', input: ': ${namaptController.text}',label2: '', input2: ''),
                          ContentString(label: 'NPWP No.', input: ': ${npwpController.text}',label2: '', input2: ''),
                          ContentString(label: '', input: '', label2: '', input2: ''),
                          ContentString(label: 'PIC User', input: ': ${picUserController.text}',label2: 'Billing PIC', input2: ': ${billingPIC.text}'),
                          ContentString(label: 'PIC Position', input: ': ${picPositionController.text}', label2: 'Billing Address', input2: ': ${billingAddress.text}'),
                          ContentString(label: 'Contact', input: ': ${contactController.text}', label2: 'Billing Contact', input2: ': ${billingContact.text}'),
                          ContentString(label: 'Email', input: ': ${emailController.text}', label2: 'Billing Email', input2: ': ${billingEmail.text}'),
                          ContentString(label: '', input: '', label2: '', input2: ''),
                          ContentString(label: 'Total Employee', input: ': ${totalEmpController.text}',label2: 'Price', input2: ': Rp. ${hargaRibuan.text}'),
                          ContentString(label: 'Discount', input: ': ${diskonController.text}%',label2: 'Price per Employee', input2: ': Rp. ${perKaryawanRibuan.text}'),
                          ContentString(label: '${keterangan}', input: '${colon} ${keterangan1Controller.text}',label2: 'After Discount', input2: ': Rp. ${setelahDiskonRibuan.text}'),
                          ContentString(label: '', input: '', label2: '', input2: ''),
                          ContentString(label: 'Training Price', input: ': ${hargaTrainingRibuan.text}',label2: 'Total Training Price', input2: ': Rp. ${totTrainingRibuan.text}'),
                          ContentString(label: 'Training Discount', input: ': ${diskonTraining.text}%',label2: '', input2: ''),
                          ContentString(label: '${keterangan2}', input: '${colon2} ${keterangan2Controller.text}',label2: '', input2: ''),
                          ContentString(label: '', input: '', label2: '', input2: ''),
                          ContentString(label: 'Implementation Price', input: ': ${hargaImplementasiRibuan.text}',label2: 'Total Implementation Price', input2: ': Rp. ${totImplementasiRibuan.text}'),
                          ContentString(label: 'Implementation Discount', input: ': ${diskonImplementasi.text}%',label2: '', input2: ''),
                          ContentString(label: '${keterangan3}', input: '${colon3} ${keterangan3Controller.text}',label2: '', input2: ''),
                          ContentString(label: '', input: '', label2: '', input2: ''),
                          ContentString(label: 'Modification Price', input: ': ${hargaModifikasiRibuan.text}',label2: 'Total Modification Price', input2: ': Rp. ${totModifikasiRibuan.text}'),
                          ContentString(label: 'Modification Discount', input: ': ${diskonModifikasi.text}%',label2: '', input2: ''),
                          ContentString(label: '${keterangan4}', input: '${colon4} ${keterangan4Controller.text}',label2: '', input2: ''),
                          ContentString(label: 'Sales Email', input: ': ${emailSalesController.text}',label2: '', input2: ''),
                        ];

                        //Meminta izin untuk mengakses penyimpanan
                        if (await Permission.storage.request().isGranted) {
                          print('Success');
                        }else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => CupertinoAlertDialog(
                                title: Text('Storage Permission'),
                                content: Text(
                                    'This app wants to request permission'),
                                actions: <Widget>[
                                  CupertinoDialogAction(
                                    child: Text('Deny'),
                                    onPressed: () => Navigator.of(context).pop(),
                                  ),
                                  CupertinoDialogAction(
                                    child: Text('Settings'),
                                    onPressed: () => openAppSettings(),
                                  ),
                                ],
                              ));
                        }

                        Navigator.push(context, MaterialPageRoute(builder: (_){
                          return CheckFile(contentTable: contentTable, tgl: tanggal, email : emailSales);
                        }));
                      },
                    ),
                    SizedBox(width: 20,),
                    RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Generate Indonesia'),
                      onPressed: () async {

                        //Menyimpan email sales ke dalam variabel
                        var emailSales = emailSalesController.text;

                        //Menghitung Harga berdasarkan jumlah karyawan
                        calculate(totalEmpController.text);

                        //Format Tanggal untuk e-sign
                        var tgl = DateFormat.yMMMd().format(_selectedDate);

                        //Jika Keterangan Kosong, maka keterangan tidak muncul
                        String keterangan;
                        String colon;
                        String keterangan2;
                        String colon2;
                        String keterangan3;
                        String colon3;
                        String keterangan4;
                        String colon4;

                        if(keterangan1Controller.text == ''){
                          keterangan = '';
                          colon = '';
                        }else{
                          keterangan = 'Keterangan 1';
                          colon = ':';
                        }

                        if(keterangan2Controller.text == ''){
                          keterangan2 = '';
                          colon2 = '';
                        }else{
                          keterangan2 = 'Keterangan 2';
                          colon2 = ':';
                        }


                        if(keterangan3Controller.text == ''){
                          keterangan3 = '';
                          colon3 = '';
                        }else{
                          keterangan3 = 'Keterangan 3';
                          colon3 = ':';
                        }


                        if(keterangan4Controller.text == ''){
                          keterangan4 = '';
                          colon4 = '';
                        }else{
                          keterangan4 = 'Keterangan 4';
                          colon4 = ':';
                        }

                        //Mengumpulkan data di dalam List
                        final contentTable = [
                          ContentString(label: '', input: '', label2: '', input2: ''),
                          ContentString(label: 'Nomor', input: ': ${nomorController.text}',label2: '', input2: ''),
                          ContentString(label: 'Tanggal', input: ': ${tanggalController.text}',label2: '', input2: ''),
                          ContentString(label: 'Nama PT', input: ': ${namaptController.text}',label2: '', input2: ''),
                          ContentString(label: 'NPWP', input: ': ${npwpController.text}',label2: '', input2: ''),
                          ContentString(label: '', input: '', label2: '', input2: ''),
                          ContentString(label: 'PIC User', input: ': ${picUserController.text}',label2: 'Billing PIC', input2: ': ${billingPIC.text}'),
                          ContentString(label: 'PIC Position', input: ': ${picPositionController.text}', label2: 'Billing Address', input2: ': ${billingAddress.text}'),
                          ContentString(label: 'Contact', input: ': ${contactController.text}', label2: 'Billing Contact', input2: ': ${billingContact.text}'),
                          ContentString(label: 'Email', input: ': ${emailController.text}', label2: 'Billing Email', input2: ': ${billingEmail.text}'),
                          ContentString(label: '', input: '', label2: '', input2: ''),
                          ContentString(label: 'Total Employee', input: ': ${totalEmpController.text}',label2: 'Harga', input2: ': Rp. ${hargaRibuan.text}'),
                          ContentString(label: 'Diskon', input: ': ${diskonController.text}%',label2: 'Harga per karyawan', input2: ': Rp. ${perKaryawanRibuan.text}'),
                          ContentString(label: '${keterangan}', input: '${colon} ${keterangan1Controller.text}',label2: 'Setelah diskon', input2: ': Rp. ${setelahDiskonRibuan.text}'),
                          ContentString(label: '', input: '', label2: '', input2: ''),
                          ContentString(label: 'Harga Training', input: ': ${hargaTrainingRibuan.text}',label2: 'Total Harga Training', input2: ': Rp. ${totTrainingRibuan.text}'),
                          ContentString(label: 'Diskon Training', input: ': ${diskonTraining.text}%',label2: '', input2: ''),
                          ContentString(label: '${keterangan2}', input: '${colon2} ${keterangan2Controller.text}',label2: '', input2: ''),
                          ContentString(label: '', input: '', label2: '', input2: ''),
                          ContentString(label: 'Harga Implementasi', input: ': ${hargaImplementasiRibuan.text}',label2: 'Total Harga Implementasi', input2: ': Rp. ${totImplementasiRibuan.text}'),
                          ContentString(label: 'Diskon Implementasi', input: ': ${diskonImplementasi.text}%',label2: '', input2: ''),
                          ContentString(label: '${keterangan3}', input: '${colon3} ${keterangan3Controller.text}',label2: '', input2: ''),
                          ContentString(label: '', input: '', label2: '', input2: ''),
                          ContentString(label: 'Harga Modifikasi', input: ': ${hargaModifikasiRibuan.text}',label2: 'Total Harga Modifikasi', input2: ': Rp. ${totModifikasiRibuan.text}'),
                          ContentString(label: 'Diskon Modifikasi', input: ': ${diskonModifikasi.text}%',label2: '', input2: ''),
                          ContentString(label: '${keterangan4}', input: '${colon4} ${keterangan4Controller.text}',label2: '', input2: ''),
                          ContentString(label: 'Email Sales', input: ': ${emailSalesController.text}',label2: '', input2: ''),
                        ];

                        //Meminta izin untuk mengakses penyimpanan
                        if (await Permission.storage.request().isGranted) {
                          print('Success');
                        }else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => CupertinoAlertDialog(
                                title: Text('Storage Permission'),
                                content: Text(
                                    'Aplikasi ini meminta anda untuk membuka akses Media dan Penyimpanan'),
                                actions: <Widget>[
                                  CupertinoDialogAction(
                                    child: Text('Deny'),
                                    onPressed: () => Navigator.of(context).pop(),
                                  ),
                                  CupertinoDialogAction(
                                    child: Text('Settings'),
                                    onPressed: () => openAppSettings(),
                                  ),
                                ],
                              ));
                        }

                        Navigator.push(context, MaterialPageRoute(builder: (_){
                          return CheckFile(contentTable: contentTable, tgl: tanggal, email : emailSales);
                        }));
                      },
                    ),
                  ],
                ),
                SizedBox(height: 30,),
              ],
            )
        )
    );
  }

  _selectDate(BuildContext context) async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: Colors.black,
                onPrimary: Colors.white,
                surface: Colors.blueGrey,
                onSurface: Colors.white,
              ),
              dialogBackgroundColor: Colors.blue[500],
            ),
            child: child,
          );
        });

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      tanggalController
        ..text = DateFormat.yMMMd().format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: tanggalController.text.length,
            affinity: TextAffinity.upstream));
    }
  }

  void calculate(String total) {
    if(total != '') {
      int harga;
      int perKaryawan;
      int totalEmp = int.parse(totalEmpController.text);
      double diskon = double.parse(diskonController.text);
      if (totalEmp < 1) {
        perKaryawan = 0;
        harga = 0;
      } else if (totalEmp <= 25) {
        perKaryawan = 500000;
        harga = perKaryawan;
      }
      else if (totalEmp < 50) {
        perKaryawan = 20000;
        harga = perKaryawan * totalEmp;
      }
      else if (totalEmp < 200) {
        perKaryawan = 18000;
        harga = perKaryawan * totalEmp;
      }
      else if (totalEmp < 350) {
        perKaryawan = 15000;
        harga = perKaryawan * totalEmp;
      }
      else if (totalEmp < 500) {
        perKaryawan = 8500;
        harga = perKaryawan * totalEmp;
      }
      else if (totalEmp < 1000) {
        perKaryawan = 7000;
        harga = perKaryawan * totalEmp;
      }
      else if (totalEmp >= 1000) {
        perKaryawan = 5500;
        harga = perKaryawan * totalEmp;
      }
      else {
        print("Error");
      }
      double hargaFix = double.parse('${harga}');
      var perKaryawanFix = double.parse('${perKaryawan}');
      var setelahDiskon = hargaFix - (hargaFix*(diskon/100.0));

      hargaRibuan.updateValue(hargaFix);
      perKaryawanRibuan.updateValue(perKaryawanFix);
      setelahDiskonRibuan.updateValue(setelahDiskon);
    }
    //Menghitung Training
    if (hargaTraining.text == ''){
      hargaTraining.text = '0';
    }
    double diskonTrain = double.parse(diskonTraining.text);
    double trainprice = double.parse(hargaTraining.text);
    var totTraining = trainprice - (trainprice*(diskonTrain/100.0));
    hargaTrainingRibuan.updateValue(trainprice);
    totTrainingRibuan.updateValue(totTraining);

    //Menghitung Implementasi
    if (hargaImplementasi.text == ''){
      hargaImplementasi.text = '0';
    }
    double diskonImplement = double.parse(diskonImplementasi.text);
    var implementPrice = double.parse(hargaImplementasi.text);
    var totImplementasi = implementPrice - (implementPrice*(diskonImplement/100.0));
    hargaImplementasiRibuan.updateValue(implementPrice);
    totImplementasiRibuan.updateValue(totImplementasi);

    //Menghitung Modifikasi
    if (hargaModifikasi.text == ''){
      hargaModifikasi.text = '0';
    }
    double diskonModif= double.parse(diskonModifikasi.text);
    var modifikasiPrice = double.parse(hargaModifikasi.text);
    var totModifikasi = modifikasiPrice - (modifikasiPrice*(diskonModif/100.0));
    hargaModifikasiRibuan.updateValue(modifikasiPrice);
    totModifikasiRibuan.updateValue(totModifikasi);

  }
}


import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:saldo/pin.dart';
import 'package:saldo/saldo.dart';
// import 'package:saldo/ui/card_create.dart';


import 'dropdown.dart';

ProgressDialog pr;


void main() => runApp(MyAppp());

class MyAppp extends StatelessWidget {
  double percentage = 0.0;
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

    double percentage = 0.0;

  @override
  Widget build(BuildContext context) {

    pr = new ProgressDialog(context,type: ProgressDialogType.Normal);

    pr.style(message: 'Showing some progress...');
    
    //Optional
    pr.style(
          message: 'Please wait...',
          borderRadius: 10.0,
          backgroundColor: Colors.white,
          progressWidget: CircularProgressIndicator(),
          elevation: 10.0,
          insetAnimCurve: Curves.easeInOut,
          progressTextStyle: TextStyle(
              color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
          messageTextStyle: TextStyle(
              color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
        );    
      Future<Widget>hme() async{
  var url = "http://192.168.43.218:8090/Server/test";
  Map json = {
    'kdid': 'LGN',
        'userid': '085643391632',
        'traceid': '909090',
        'data': {'user': '08151646351', 'pas': '111', 'imei': '865689030885309'}
  };
  HttpClientResponse response;
  var client = HttpClient();
  var timestamp = DateTime.now();
  try{
    HttpClientRequest request = await client.postUrl(Uri.parse(url));
    request.headers.set('Content-type', 'application/json');
    request.headers.set('signature', '');
    request.headers.set('timestamp', timestamp);
    request.add(utf8.encode(jsonEncode(json)));
    response=await request.close();
    response.transform(utf8.decoder).listen((contents){
      // print(contents);
      var jsondata = jsonDecode(contents);
      var pinn = jsondata['PIN'];
      // var p = jsondata['notab'];
      // var ntb = jsonEncode(p);
      var jsonall = jsonEncode(jsondata['data']);
      var b = jsonDecode(jsonall);
      var p = b['notab'];
      // var ntb = jsonEncode(dcntb);
      print(pinn);
      print(p);
      print(jsondata['rc']);
      // print(jsondata['notab']);
      if(jsondata['rc']=='000'){
    var route = new MaterialPageRoute(
          builder: (BuildContext context) => new Saldo(notab: p, pin:pinn),
        );
        Navigator.of(context).push(route);
   }
   else{
     print('g');
   }
    });
  }on SocketException catch(x){
    print(x);
    // var prosessDialog;
    //     if (prosessDialog.isShowing()){
    //     prosessDialog.desimiss();
    // }
  }
}
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              color: Colors.grey[300],
              onPressed: () {
               hme();
              //  pr.show();
              //  Future.delayed(Duration(seconds: 2)).then((onValue){
              //   print("PR status  ${pr.isShowing()}" );
              //   if(pr.isShowing())
              //     pr.hide();
              //   print("PR status  ${pr.isShowing()}" );
              // });

              },
              child: Text("data"),
            )
          ],
        ),
      ),
    );
  }
}

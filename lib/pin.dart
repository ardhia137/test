import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import 'package:saldo/saldo.dart';

class Pin extends StatelessWidget {
  String notabb;
  String pinn;
  Pin(this.notabb, this.pinn);

  @override
  Widget build(BuildContext context) {
    Future<Widget> sld(pin, notabb) async {
      var url = "http://192.168.43.218:8090/Server/test";
      Map json = {
        'kdid': 'SLD',
        'userid': '08151646351',
        'traceid': '3284284',
        'data': {'pin': pin, 'imei': '863147040869906', 'notab': notabb}
      };
      HttpClientResponse response;
      var client = HttpClient();
      var timestamp = DateTime.now();
      try {
        HttpClientRequest request = await client.postUrl(Uri.parse(url));
        request.headers.set('Content-type', 'application/json');
        request.headers.set('signature', '');
        request.headers.set('timestamp', timestamp);
        request.add(utf8.encode(jsonEncode(json)));
        response = await request.close();
        response.transform(utf8.decoder).listen((contents) {
          // print(contents);
          var jsondata = jsonDecode(contents);
          var p = jsondata['notab'];
          var pinn = jsondata['pin'];
          var ntb = jsonEncode(p);
          var b = jsondata['data'];
          var sald = b['saldo'];
          print(jsondata['rc']);
          print(b['saldo']);
          // print(jsondata['notab']);
          if (jsondata['rc'] == '000') {
            var route = new MaterialPageRoute(
              builder: (BuildContext context) => BankCard(
                ntb: notabb,
                sld: sald,
              ),
            );
            Navigator.of(context).push(route);
          } else {
            print('g');
          }
        });
      } on SocketException catch (x) {
        print(x);
        // var prosessDialog;
        //     if (prosessDialog.isShowing()){
        //     prosessDialog.desimiss();
        // }
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // children: <Widget>[
            // Center(

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 180.0,
                  ),
                  child: Column(
                    children: <Widget>[
                      // StakedIcons(),
                      Padding(
                          padding: const EdgeInsets.only(
                            top: 20.0,
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Icon(Icons.lock_outline,
                                    size: 70, color: Colors.blue),
                              ),
                              Text(
                                "Masukan Pin",
                                style: new TextStyle(fontSize: 30.0),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PinEntryTextField(
                isTextObscure: true,
                showFieldAsBox: false,
                onSubmit: (String pin) {
                  if (pin == pinn) {
                    print(pinn);
                    print(notabb);
                    sld(pin, notabb);
                    // var route = new MaterialPageRoute(
                    //   builder: (BuildContext context) => BankCard(ntb:notabb),
                    // );
                    // Navigator.of(context).push(route);
                  } else {
                    print("salah");
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

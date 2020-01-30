import 'package:flutter/material.dart';
import 'package:saldo/bank_card.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

void main() {
  runApp(BankCard());
}


class BankCard extends StatelessWidget {
  String ntb;
  double sld;
  // final String value;

  BankCard({this.ntb,this.sld});
  build(context) {
    if (sld == null) {
     double sald =0;
     return  test(ntb,sald);
    } else {
     double sald = sld;
     return  test(ntb,sald);
    }
  }
  

}

Widget test(ntb,sald) {
  FlutterMoneyFormatter fmf = FlutterMoneyFormatter(amount: sald);
  var saldo = fmf.output.withoutFractionDigits;
  print(saldo);
  if (saldo == null) {
    print("object");
  }
  else{
    return MaterialApp(
    home: Scaffold(
    body: 
    Center(
          child: Container(
      // color: Colors.red,
      height: 250,
      width: 400,
      // margin: EdgeInsets.only(top: 100.0), //CODE BARU UNTUK MENGATUR MARGIN
      child: Center(
        child: Container(
          child: Stack(
            children: <Widget>[
              Center(
                child:Container(
                child: new Image.asset(
                  'bg_blue_circle_card.png',
                  fit: BoxFit.fill,
                  width: 400,
                  height: 250,
                ),
              ),
              
              ),
              Container(
                padding: EdgeInsets.only( left: 308),
                child: Image.asset('creditcardchipsilver.png',
                width: 70,
                height: 120,
                )
              ),
              
              Container(
                padding: EdgeInsets.only(top: 70, left: 30),
                child: Text("${ntb}",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 25.0,
                        color: Colors.white)),
              ),
              Container(
                margin: EdgeInsets.only(top: 160, left: 25),
                child: Text("SALDO",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20.0,
                        color: Colors.white)),
              ),
              Container(
                margin: EdgeInsets.only(top: 190, left: 25),
                child: Text("Rp.${saldo}",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20.0,
                        color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
  ),
    )));
  }
}

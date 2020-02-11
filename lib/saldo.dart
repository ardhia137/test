import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saldo/bank_card.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(BankCard());
}

class BankCard extends StatelessWidget {
  String ntb;
  double sld;
  // final String value;

  BankCard({this.ntb, this.sld});
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);

    if (sld == null) {
      double sald = 0;
      return test(ntb, sald, context);
    } else {
      double sald = sld;
      return test(ntb, sald, context);
    }
  }

// @overide
  Widget test(ntb, sald, context) {
    FlutterMoneyFormatter fmf = FlutterMoneyFormatter(amount: sald);
    var saldo = fmf.output.withoutFractionDigits;
    print(saldo);
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Saldo"),
        // centerTitle: true,
      ),
      body: Container(
        child: Container(
          // color: Colors.white,
          height: ScreenUtil().setHeight(450),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            // color: Colors.red,
            height: ScreenUtil().setHeight(400),
            width: ScreenUtil().setWidth(700),
            // margin: EdgeInsets.only(top: 100.0), 
            // child: Center(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Center(
                      child: Container(
                        child: new Image.asset('bg_blue_circle_card.png',
                            fit: BoxFit.fill,
                            width: ScreenUtil().setWidth(700),
                            height: ScreenUtil().setHeight(400)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: ScreenUtil().setHeight(110),
                          left: ScreenUtil().setWidth(55)),
                      child: Text("${ntb}",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: ScreenUtil().setSp(50),
                              color: Colors.white)),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: ScreenUtil().setHeight(250),
                          left: ScreenUtil().setWidth(55)),
                      child: Text("SALDO",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: ScreenUtil().setSp(40),
                              color: Colors.white)),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: ScreenUtil().setHeight(290),
                          left: ScreenUtil().setWidth(55)),
                      child: Text("Rp.${saldo}",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: ScreenUtil().setSp(40),
                              color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                    offset: Offset(0.0, 0.0))
              ]),
        ),
      ),
      // ),
    ));
  }
}

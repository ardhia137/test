import 'package:flutter/material.dart';
import 'pin.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MaterialApp(
    home: Saldo(
      
    ),
  ));
}

class Saldo extends StatelessWidget {
  List notab;
  String pin;
  Saldo({this.notab, this.pin});

  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Saldo"),
        // centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: notab == null ? 0 : notab.length,
        itemBuilder: (context, i) {
          return Container(
              child: GestureDetector(
                  onTap: () {
                    var route = new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          MPin(notabb:notab[i],pinn:pin),
                    );
                    Navigator.of(context).push(route);
                  },
                  child: buildCard('Nomor Rekening', notab[i])));
        },
      ),
    );
  }

  Container buildCard(
    String norek,
    String text,
  ) {
    return Container(
      // elevation: 5,
      child: InkWell(
     
        child: Container(
          height: ScreenUtil().setHeight(170),
          // margin: EdgeInsets.fromLTRB(20, 0, 20,15),
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(39), 13, 5, 13),
          child: Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(norek, style: TextStyle(fontWeight: FontWeight.bold,fontSize: ScreenUtil().setSp(34, allowFontScalingSelf: true))),
                    Text(text,style: TextStyle(fontSize: ScreenUtil().setSp(34, allowFontScalingSelf: true)),),
                  ],
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  stops: [0.030, 0.030], colors: [Colors.blue, Colors.white]),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                    offset: Offset(0.0, 0.0))
              ]),
        ),
      ),
    );
  }
}

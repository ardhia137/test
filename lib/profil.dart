import 'package:flutter/material.dart';

class Profil extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   var aLine = Container(
      // padding: EdgeInsets.all(10),
      color: Colors.grey,
      width: 450,
      height: 0.5,
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          title: Text('Data'),
        ),
      ),
      body: Container(
        color: Colors.grey[200],
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 28),
              color: Colors.white,
              height: 120,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    child: 'Ujang'.substring(0,1),
                  )
                  Container(
                      padding: EdgeInsets.only(left: 17),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: 5),
                            child: Text('ORANG',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                )),
                          ),
                          Text('0812-3456-7891',
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 19))
                        ],
                      ))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(5),
              color: Colors.white,
              // height: 100,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: (){
                      print('object1');
                    },
                    child: Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  'Keamanan',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                // color: Colors.red,
                                width: 450,
                                margin: EdgeInsets.only(top: 30, bottom: 10),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  // crossAxisAlignment: ,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: Icon(Icons.vpn_key),
                                    ),
                                    Container(
                                      child: Text(
                                        'Ubah Password',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Icon(Icons.keyboard_arrow_right),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              aLine,
                              InkWell(
                                onTap: () {
                                  print('object');
                                },
                                child: Container(
                                  // color: Colors.red,
                                  width: 450,
                                  margin: EdgeInsets.only(top: 25, bottom: 10),
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    // crossAxisAlignment: ,
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(right: 10),
                                        child: Icon(Icons.lock),
                                      ),
                                      Container(
                                        child: Text(
                                          'Ubah PIN',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child:
                                              Icon(Icons.keyboard_arrow_right),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              aLine
                              // Divider(color: Colors.grey,)
                            ])),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    );
  }
}
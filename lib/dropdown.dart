import 'package:flutter/material.dart';
import 'package:saldo/pin.dart';

import 'main.dart';

void main() => runApp(Saldo());

class Saldo extends StatefulWidget {
  List notab;
  String pin;
  // final String value;

  Saldo({this.notab, this.pin});
  @override
  _SaldoState createState() => _SaldoState(notab, pin);
}

class _SaldoState extends State<Saldo> {
  List notab;
  String pin;
  _SaldoState(this.notab, this.pin);

  // List _fruits = ["Apple", "Banana", "Pineapple", "Mango", "Grapes"];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _selectedFruit ;

  @override
  void initState() {
    _dropDownMenuItems = buildAndGetDropDownMenuItems(notab);
    _selectedFruit = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> buildAndGetDropDownMenuItems(List fruits) {
    List<DropdownMenuItem<String>> items = List();
    for (String fruit in fruits) {
      items.add(DropdownMenuItem(value: fruit, child: Text(fruit)));
    }
    return items;
  }

  void changedDropDownItem(String selectedFruit) {
    setState(() {
      _selectedFruit = selectedFruit;
      print(_selectedFruit);
      print(pin);
      var route = new MaterialPageRoute(
        builder: (BuildContext context) => new Pin(_selectedFruit, pin),
      );
      Navigator.of(context).push(route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("DropDown Button Example"),
        ),
        body: notab == null
            ? CircularProgressIndicator()
            : Container(
                child: Container(
                    margin: EdgeInsets.only(top: 10, left: 20),
                    // color: Colors.red,
                    // width: ,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Please choose a fruit: "),
                        DropdownButton(
                          underline: Container(
                      
                            height: 2,
                            width: 1000,
                            color: Colors.blue,
                          ),
                          value: _selectedFruit,
                          items: _dropDownMenuItems,
                          onChanged: changedDropDownItem,
                        )
                      ],
                    )),
              ),
      ),
    );
  }
}

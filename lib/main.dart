import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(
    title: "Simple Interest Calculator",
    home: SIForm(),
    theme: ThemeData(
      primaryColor: Colors.indigo,
      accentColor: Colors.indigo,
      brightness: Brightness.dark,
      //brightness: Brightness.dark
    ),
    debugShowCheckedModeBanner: false,
  ));
}

class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SIFormState();
  }
}

class SIFormState extends State<SIForm> {
  final minPadding = 5.0;
  var currencies = ["Rupees", "Pounds", "Dollars", "Euros"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("SI Calculator"),
        ),
        body: Container(
          margin: EdgeInsets.all(minPadding),
          child: ListView(
            children: <Widget>[
              Center(
                child: getImageAsset(),
              ),
              Padding(
                  padding: EdgeInsets.only(top: minPadding, bottom: minPadding),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Principal",
                        hintText: "Enter Principal eg: 2000",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    keyboardType: TextInputType.number,
                  )),
              Padding(
                padding: EdgeInsets.only(top: minPadding, bottom: minPadding),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Rate",
                      hintText: "Enter Rate in Percent",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  keyboardType: TextInputType.number,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.only(right: minPadding, top: minPadding),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: "Time",
                            hintText: "Enter Time in Years",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(top: minPadding, left: minPadding),
                    child: DropdownButton<String>(
                      items: currencies.map(
                        (String value) {
                          return DropdownMenuItem<String>(
                              child: Text(value), value: value);
                        },
                      ).toList(),
                      value: "Rupees",
                      onChanged: (String newValue) {},
                    ),
                  ))
                ],
              ),
              Padding(
                  padding: EdgeInsets.all(minPadding),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                              padding: EdgeInsets.only(right: minPadding),
                              child: RaisedButton(
                                  color: Colors.deepPurple,
                                  textColor: Colors.white,
                                  child: Text("Calculate",textScaleFactor: 1.5),
                                  onPressed: null))),
                      Expanded(
                          child: Container(
                              padding: EdgeInsets.only(left: minPadding),
                              child: RaisedButton(
                                  color: Colors.deepPurple,
                                  textColor: Colors.white,
                                  child: Text("Reset",textScaleFactor: 1.5),
                                  onPressed: null)))
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.all(minPadding),
                  child: Center(child: Text("Todo Text")))
            ],
          ),
        ));
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('images/money_.jpeg');
    Image image = Image(image: assetImage, height: 200.0, width: 200.0);
    return Container(
      child: image,
      margin: EdgeInsets.all(minPadding),
    );
  }
}

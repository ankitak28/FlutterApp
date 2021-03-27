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
  var currentCurrency = "Rupees";
  TextEditingController principalController = new TextEditingController();
  TextEditingController rateController = new TextEditingController();
  TextEditingController timeController = new TextEditingController();
  var displayText = "";

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
                    controller: principalController,
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
                  controller: rateController,
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
                        controller: timeController,
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
                      value: currentCurrency,
                      onChanged: (String newValue) {
                        DropdownItemSelected(newValue);
                      },
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
                                  onPressed: (){
                                    setState(() {
                                      this.displayText = calculateTotalReturns();
                                    });
                                  }))),
                      Expanded(
                          child: Container(
                              padding: EdgeInsets.only(left: minPadding),
                              child: RaisedButton(
                                  color: Colors.deepPurple,
                                  textColor: Colors.white,
                                  child: Text("Reset",textScaleFactor: 1.5),
                                  onPressed: (){
                                    setState(() {
                                      resetFields();
                                    });
                                  })))
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.all(minPadding),
                  child: Center(
                      child: Text(this.displayText)))
            ],
          ),
        ));
  }

  void DropdownItemSelected(String newValue){
    setState(() {
      this.currentCurrency = newValue;
    });
  }
  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('images/money_.jpeg');
    Image image = Image(image: assetImage, height: 200.0, width: 200.0);
    return Container(
      child: image,
      margin: EdgeInsets.all(minPadding),
    );
  }
  String calculateTotalReturns(){
    double principal = double.parse(principalController.text);
    double rate = double.parse(rateController.text);
    double time = double.parse(timeController.text);
    double totalAmountPayable = principal + (principal * rate * time)/1000;
    return "After $time year of investment your investment will be worth $totalAmountPayable $currentCurrency";
  }
  void resetFields(){
    this.principalController.text = '';
    this.timeController.text = '';
    this.rateController.text = '';
    this.currentCurrency = '';
    this.displayText = '';

  }
}

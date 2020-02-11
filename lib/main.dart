import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'horizontal_numberpicker_wrapper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NumberFormat _numberFormat = NumberFormat(',000');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              HorizontalNumberPickerWrapper(
                initialValue: 160,
                minValue: 100,
                maxValue: 200,
                step: 1,
                unit: 'CM',
                widgetWidth: MediaQuery.of(context).size.width.round() - 30,
                subGridCountPerGrid: 10,
                subGridWidth: 8,
                onSelectedChanged: (value) {
                  print(value);
                },
              ),
              Container(height: 10),
              HorizontalNumberPickerWrapper(
                initialValue: 600,
                minValue: 100,
                maxValue: 1500,
                step: 1,
                unit: 'KG',
                widgetWidth: MediaQuery.of(context).size.width.round() - 30,
                subGridCountPerGrid: 10,
                subGridWidth: 8,
                onSelectedChanged: (value) {
                  print(value / 10);
                },
                titleTransformer: (value) {
                  return formatIntegerStr(value / 10);
                },
                scaleTransformer: (value) {
                  return formatIntegerStr(value / 10);
                },
              ),
              Container(height: 10),
              HorizontalNumberPickerWrapper(
                initialValue: 100,
                minValue: 0,
                maxValue: 300,
                step: 1,
                unit: 'mmHg',
                widgetWidth: MediaQuery.of(context).size.width.round() - 30,
                subGridCountPerGrid: 2,
                subGridWidth: 20,
                onSelectedChanged: (value) {
                  print(value);
                },
              ),
              Container(height: 10),
              HorizontalNumberPickerWrapper(
                initialValue: 80,
                minValue: 10,
                maxValue: 250,
                step: 1,
                unit: 'mmol/L',
                widgetWidth: MediaQuery.of(context).size.width.round() - 30,
                subGridCountPerGrid: 2,
                subGridWidth: 20,
                onSelectedChanged: (value) {
                  print(value / 10);
                },
                titleTransformer: (value) {
                  return formatIntegerStr(value / 10);
                },
                scaleTransformer: (value) {
                  return formatIntegerStr(value / 10);
                },
              ),
              Container(height: 10),
              HorizontalNumberPickerWrapper(
                initialValue: 6000,
                minValue: 1000,
                maxValue: 21000,
                step: 1000,
                unit: '步',
                widgetWidth: MediaQuery.of(context).size.width.round() - 30,
                subGridCountPerGrid: 2,
                subGridWidth: 20,
                onSelectedChanged: (value) {
                  print(value);
                },
                titleTransformer: (value) {
                  return _numberFormat.format(value);
                },
                scaleTransformer: (value) {
                  return '${value ~/ 1000}k';
                },
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

///去掉整数后的小数点和0
///1.0 -> "1"
///1.2 -> "1.2"
String formatIntegerStr(num number) {
  int intNumber = number.truncate();

  //是整数
  if (intNumber == number) {
    return intNumber.toString();
  } else {
    return number.toString();
  }
}

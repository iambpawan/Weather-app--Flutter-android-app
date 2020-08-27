import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/utilities/constants.dart';

class DayWeather extends StatefulWidget {
  @override
  _DayWeatherState createState() => _DayWeatherState();
}

class _DayWeatherState extends State<DayWeather> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      color: Color(0xff467BA2),
      child: Container(
        margin: EdgeInsets.only(bottom: 20.0, left: 10.0, right: 10.0),
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
            bottomRight: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('Today', style: kTBLTextStyle),
                //Text('Hyderabad', style: kTBLTextStyle),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Table(
                      // defaultVerticalAlignment: TableCellVerticalAlignment.top,
                      defaultColumnWidth: FixedColumnWidth(
                          MediaQuery.of(context).size.width / 2),
                      border: TableBorder.all(
                          color: Colors.black,
                          width: 1,
                          style: BorderStyle.none),
                      children: [
                        TableRow(children: [
                          TableCell(
                              child: Text('Sunrises',
                                  textScaleFactor: 1.1,
                                  style: kTBL_LTextStyle)),
                          TableCell(
                              child: Center(
                                  child: Text('Value',
                                      textAlign: TextAlign.left,
                                      style: kTBL_RTextStyle))),
                        ]),
                        TableRow(children: [
                          TableCell(
                              child: Text('Sunsets',
                                  textScaleFactor: 1.1,
                                  style: kTBL_LTextStyle)),
                          TableCell(
                              child: Center(
                                  child: Text('Value',
                                      textAlign: TextAlign.left,
                                      style: kTBL_RTextStyle))),
                        ]),
                        TableRow(children: [
                          TableCell(
                              child: Text('Temperature',
                                  textScaleFactor: 1.1,
                                  style: kTBL_LTextStyle)),
                          TableCell(
                              child: Center(
                                  child:
                                      Text('Value', style: kTBL_RTextStyle))),
                        ]),
                        TableRow(children: [
                          TableCell(
                              child: Text('Feels\'s like ',
                                  textScaleFactor: 1.1,
                                  style: kTBL_LTextStyle)),
                          TableCell(
                              child: Center(
                                  child:
                                      Text('Value', style: kTBL_RTextStyle))),
                        ]),
                        TableRow(children: [
                          TableCell(
                              child: Text('Pressure',
                                  textScaleFactor: 1.1,
                                  style: kTBL_LTextStyle)),
                          TableCell(
                              child: Center(
                                  child:
                                      Text('Value', style: kTBL_RTextStyle))),
                        ]),
                        TableRow(children: [
                          TableCell(
                              child: Text('Humidity',
                                  textScaleFactor: 1.1,
                                  style: kTBL_LTextStyle)),
                          TableCell(
                              child: Center(
                                  child:
                                      Text('Value', style: kTBL_RTextStyle))),
                        ]),
                        TableRow(children: [
                          TableCell(
                              child: Text('Wind Speed',
                                  textScaleFactor: 1.1,
                                  style: kTBL_LTextStyle)),
                          TableCell(
                              child: Center(
                                  child:
                                      Text('Value', style: kTBL_RTextStyle))),
                        ]),
                      ]),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

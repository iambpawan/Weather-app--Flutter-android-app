import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/services/weather.dart';
import 'package:weather_app/utilities/constants.dart';

import 'city_screen.dart';
import 'dayWeather.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather, this.oneCallAll});
  final locationWeather;
  final oneCallAll;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  bool changeColor = false;
  WeatherModel weather = WeatherModel();
  int temperature, now, n1, n2, n3, n4;
  String weatherIcon;
  String cityName;
  String weatherMessage;
  String iconimage;
  String time;
  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather, widget.oneCallAll);
  }

  void updateUI(dynamic weatherData, dynamic latLon) {
    setState(
      () {
        if (weatherData == null || latLon == null) {
          temperature = 0;
          weatherIcon = 'Error';
          weatherMessage = '?';
          cityName = 'ERROR';

          return;
        }
        double temp = weatherData['main']['temp'];
        temperature = temp.toInt();
        weatherMessage = weatherData['weather'][0]['description'];
        cityName = weatherData['name'];
        iconimage = weatherData['weather'][0]['icon'];
        time = DateFormat.yMEd().add_jms().format(
            DateTime.fromMillisecondsSinceEpoch(weatherData['sys']['sunrise']));
        print(time);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.9), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () async {
                            var weatherData =
                                await weather.getLocationWeather();
                            var latLon = await weather.getOnecall(
                                weatherData['coord']['lon'],
                                weatherData['coord']['lat']);
                            updateUI(weatherData, latLon);
                          },
                          child: Icon(
                            Icons.near_me,
                            size: 40.0,
                          ),
                        ),
                        FlatButton(
                          onPressed: () async {
                            var typedName = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return CityScreen();
                                },
                              ),
                            );
                            if (typedName != null) {
                              var weatherData =
                                  await weather.getCityWeather(typedName);
                              var latLon = await weather.getOnecall(
                                  weatherData['coord']['lon'],
                                  weatherData['coord']['lat']);
                              updateUI(weatherData, latLon);
                            }
                          },
                          child: Icon(
                            Icons.location_city,
                            size: 40.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          '$weatherMessage',
                          style: kMessageTextStyle,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '$temperature°',
                          style: kTempTextStyle,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 150.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/icons/11d.png"),
                              fit: BoxFit.fitHeight,
                              alignment: Alignment.center,
                            ),
                            //color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      buildCard('11d', weatherIcon),
                      buildCard('11d', weatherIcon),
                      buildCard('11d', weatherIcon),
                      buildCard('11n', weatherIcon),
                      buildCard('11d', weatherIcon),
                    ],
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: BottomButtonL(),
                      ),
                      //SizedBox(height: 50.0),
//                      SizedBox(
//                        width: 5.0,
//                      ),
//                      Expanded(
//                        child: BottomButtonR(),
//                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Card buildCard(icon, tem) {
    return Card(
      elevation: 0.0,
      color: Color.fromRGBO(78, 129, 164, 0),
      child: Container(
        height: 99.0,
        width: 70.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/icons/$icon.png"),
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,
          ),
          //color: Colors.red,
        ),
        child: Text(
          '23°',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
    );
  }
}

class BottomButtonL extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      child: GestureDetector(
        onTap: () {
          showBottomSheet(context: context, builder: (context) => DayWeather());
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 10.0, left: 15.0, right: 15.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              style: BorderStyle.solid,
              width: 2.0,
            ),
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  "TODAY",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Roboto',
                    letterSpacing: 1,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BottomButtonR extends StatelessWidget {
  const BottomButtonR({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 5.0, color: Colors.lightBlue.shade900),
        ),
      ),
      child: RaisedButton(
        color: Color.fromRGBO(78, 130, 165, 1),
        onPressed: () async {
          showBottomSheet(context: context, builder: (context) => DayWeather());
        },
        child: Text(
          'Tomorrow',
          style: TextStyle(
            fontSize: 18.0,
            fontFamily: 'Roboto',
            letterSpacing: 1.0,
          ),
        ),
      ),
    );
  }
}

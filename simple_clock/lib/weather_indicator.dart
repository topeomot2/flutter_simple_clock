import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/model.dart';

class WeatherIndicator extends StatelessWidget {
  final ClockModel model;
  final double fontSize;

  const WeatherIndicator({Key key, this.model, this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (this.model.weatherCondition) {
      case WeatherCondition.cloudy:
        return Row(
          children: <Widget>[
            Expanded(
              child: Image.asset(
                "assets/images/cloudy.png",
              ),
              flex: 1,
            ),
            Expanded(
              child: Text(model.temperatureString,
                  style: TextStyle(fontSize: fontSize)),
              flex: 1,
            )
          ],
        );
        break;
      case WeatherCondition.foggy:
        return Row(
          children: <Widget>[
            Expanded(
              child: Image.asset(
                "assets/images/foggy.png",
              ),
              flex: 1,
            ),
            Expanded(
              child: Text(model.temperatureString,
                  style: TextStyle(fontSize: fontSize)),
              flex: 1,
            )
          ],
        );
        break;
      case WeatherCondition.rainy:
        return Row(
          children: <Widget>[
            Expanded(
              child: Image.asset(
                "assets/images/rainy.png",
              ),
              flex: 1,
            ),
            Expanded(
              child: Text(model.temperatureString,
                  style: TextStyle(fontSize: fontSize)),
              flex: 1,
            )
          ],
        );
        break;
      case WeatherCondition.snowy:
        return Row(
          children: <Widget>[
            Expanded(
              child: Image.asset(
                "assets/images/snowy.png",
              ),
              flex: 1,
            ),
            Expanded(
              child: Text(model.temperatureString,
                  style: TextStyle(fontSize: fontSize)),
              flex: 1,
            )
          ],
        );
        break;
      case WeatherCondition.sunny:
        return Row(
          children: <Widget>[
            Expanded(
              child: Image.asset(
                "assets/images/sunny.png",
              ),
              flex: 1,
            ),
            Expanded(
              child: Text(model.temperatureString,
                  style: TextStyle(fontSize: fontSize)),
              flex: 1,
            )
          ],
        );
        break;
      case WeatherCondition.thunderstorm:
        return Row(
          children: <Widget>[
            Expanded(
              child: Image.asset(
                "assets/images/thunderstorm.png",
              ),
              flex: 1,
            ),
            Expanded(
              child: Text(model.temperatureString,
                  style: TextStyle(fontSize: fontSize)),
              flex: 1,
            )
          ],
        );
        break;
      case WeatherCondition.windy:
        return Row(
          children: <Widget>[
            Expanded(
              child: Image.asset(
                "assets/images/windy.png",
              ),
              flex: 1,
            ),
            Expanded(
              child: Text(model.temperatureString,
                  style: TextStyle(fontSize: fontSize)),
              flex: 1,
            )
          ],
        );
        break;
      default:
        return Row(
          children: <Widget>[
            Expanded(
              child: Image.asset(
                "assets/images/sunny.png",
              ),
              flex: 1,
            ),
            Expanded(
              child: Text(model.temperatureString,
                  style: TextStyle(fontSize: fontSize)),
              flex: 1,
            )
          ],
        );
    }
  }
}

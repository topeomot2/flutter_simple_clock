// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter_clock_helper/model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'weather_indicator.dart';

enum _Element {
  background,
  text,
  shadow,
}

final _lightTheme = {
  _Element.background: Colors.white,
  _Element.text: Colors.black,
  _Element.shadow: Colors.black,
};

final _darkTheme = {
  _Element.background: Colors.black,
  _Element.text: Colors.white,
  _Element.shadow: Color(0xFF174EA6),
};

/// A basic digital clock.
///
/// You can do better than this!
class DigitalClock extends StatefulWidget {
  const DigitalClock(this.model);

  final ClockModel model;

  @override
  _DigitalClockState createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  DateTime _dateTime = DateTime.now();
  Timer _timer;

  @override
  void initState() {
    super.initState();
    widget.model.addListener(_updateModel);
    _updateTime();
    _updateModel();
  }

  @override
  void didUpdateWidget(DigitalClock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.model != oldWidget.model) {
      oldWidget.model.removeListener(_updateModel);
      widget.model.addListener(_updateModel);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.model.removeListener(_updateModel);
    widget.model.dispose();
    super.dispose();
  }

  void _updateModel() {
    setState(() {
      // Cause the clock to rebuild when the model changes.
    });
  }

  void _updateTime() {
    setState(() {
      _dateTime = DateTime.now();
      // Update once per minute. If you want to update every second, use the
      // following code.
      _timer = Timer(
        Duration(minutes: 1) -
            Duration(seconds: _dateTime.second) -
            Duration(milliseconds: _dateTime.millisecond),
        _updateTime,
      );
      // Update once per second, but make sure to do it at the beginning of each
      // new second, so that the clock is accurate.
      // _timer = Timer(
      //   Duration(seconds: 1) - Duration(milliseconds: _dateTime.millisecond),
      //   _updateTime,
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).brightness == Brightness.light
        ? _lightTheme
        : _darkTheme;
    final time = DateFormat.Hm().format(_dateTime);
    final day = DateFormat('EEE d MMMM').format(_dateTime);
    final fontSize = MediaQuery.of(context).size.width / 4.0;
    final smallerFontSize = MediaQuery.of(context).size.width / 15.0;
    final smallestFontSize = MediaQuery.of(context).size.width / 30.0;
    final offset = -fontSize / 7;
    final defaultStyle = TextStyle(
        color: colors[_Element.text],
        fontFamily: 'RobotoCondensed',
        fontSize: fontSize);

    return Container(
      color: colors[_Element.background],
      child: DefaultTextStyle(
          style: defaultStyle,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Positioned(
                  top: 0,
                  width: fontSize,
                  child: WeatherIndicator(
                    model: widget.model,
                    fontSize: smallestFontSize,
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(time),
                  Text(
                    day,
                    style: TextStyle(fontSize: smallerFontSize),
                  )
                ],
              ),
              Positioned(
                  bottom: 10,
                  right: 10,
                  width: fontSize,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Icon(Icons.location_on),
                        flex: 1,
                      ),
                      Expanded(
                        child: Text(widget.model.location,
                            style: TextStyle(fontSize: smallestFontSize)),
                        flex: 2,
                      ),
                    ],
                  )),
            ],
          )),
    );
  }
}

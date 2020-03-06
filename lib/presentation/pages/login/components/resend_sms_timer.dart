import 'dart:async';

import 'package:flutter/material.dart';

class ResendSmsTimer extends StatefulWidget {
  ResendSmsTimer({Key key}) : super(key: key);

  @override
  _ResendSmsTimerState createState() => _ResendSmsTimerState();
}

class _ResendSmsTimerState extends State<ResendSmsTimer> {
  Timer _timer;
  int countDownNum = 50;

  @override
  void initState() {
    super.initState();
    _startCountDown();
  }

  _startCountDown() {
    _timer = new Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (countDownNum > 0) {
          countDownNum = countDownNum - 1;
        } else {
          _timer.cancel();
          _timer = null;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (countDownNum == 0) {
          // send SMS message code
          countDownNum = 50;
          _startCountDown();
        }
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            '重新发送',
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
          SizedBox(width: 3.0),
          Text(
            '${countDownNum == 0 ? "" : (countDownNum)}',
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    _timer = null;
  }
}

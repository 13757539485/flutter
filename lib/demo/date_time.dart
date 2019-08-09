import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeDatePage extends StatefulWidget {
  TimeDatePage({Key key}) : super(key: key);

  _TimeDatePageState createState() => _TimeDatePageState();
}

class _TimeDatePageState extends State<TimeDatePage> {
  DateTime _dateTime = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay.now();

  Future<void> _showDate() async {
    final DateTime dateTime = await showDatePicker(
        context: context,
        initialDate: this._dateTime,
        firstDate: DateTime(1980),
        lastDate: DateTime(2050));
    if (dateTime == null) return;
    setState(() {
      this._dateTime = dateTime;
    });
  }

  Future<void> _showTime() async {
    final TimeOfDay timeOfDay = await showTimePicker(
      context: context,
      initialTime: _timeOfDay,
    );
    if (timeOfDay == null) return;
    setState(() {
      this._timeOfDay = timeOfDay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () {
                _showDate().then((value){
                    //回调方法
                });
              },
              child: Row(
                children: <Widget>[
                  Text(DateFormat.yMd().format(this._dateTime)),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () {
                _showTime();
              },
              child: Row(
                children: <Widget>[
                  Text(this._timeOfDay.format(context)),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

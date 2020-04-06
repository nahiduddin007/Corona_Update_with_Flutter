import 'package:flutter/material.dart';

class ChartRowWithLabel extends StatelessWidget {
  ChartRowWithLabel({@required this.text, @required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: <Widget>[
          Container(
            color: color,
            height: 16,
            width: 16,
            child: null,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
              '$text'
          ),
        ],
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  DashboardCard({@required this.title, @required this.number, @required this.color});

  final String title;
  final String number;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                color: color,
                height: 16,
                width: 16,
                child: null,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                  '$title'
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          FittedBox(
            child: Text(
              '$number',
              style: TextStyle(
                  fontSize: 25
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RichTextLabel extends StatelessWidget {

  RichTextLabel({@required this.name, @required this.value});

  final String name;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '$name',
            style: TextStyle(
                fontSize: 16
            ),
          ),
          Text(
            '$value',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600
            ),
          )
        ],
      ),
    );
  }
}

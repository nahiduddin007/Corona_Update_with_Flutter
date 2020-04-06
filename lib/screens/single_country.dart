import 'package:covid19cases/models/country.dart';
import 'package:covid19cases/network/network_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../utils/reuseable_widgets.dart';

class SingleCountry extends StatefulWidget {
  SingleCountry({@required this.country});

  final Country country;

  @override
  _SingleCountryState createState() => _SingleCountryState();
}

class _SingleCountryState extends State<SingleCountry> {

  List<PieChartSectionData> _data = [];

  addPieChartData(){
    PieChartSectionData _data1 = PieChartSectionData(
        color: Colors.purple,
        title: '${widget.country.cases}',
        radius: 50,
        titleStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w300
        )
    );
    PieChartSectionData _data2 = PieChartSectionData(
        color: Colors.red,
        value: (widget.country.deaths)/(widget.country.cases/100),
        title: '${widget.country.deaths}',
        radius: 50,
        titleStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w300
        )
    );
    PieChartSectionData _data3 = PieChartSectionData(
        color: Colors.green,
        value: (widget.country.recovered)/(widget.country.cases/100),
        title: '${widget.country.recovered}',
        radius: 50,
        titleStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w300
        )
    );

    _data.add(_data1);
    _data.add(_data2);
    _data.add(_data3);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addPieChartData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        backgroundColor: Colors.black,
        title: Row(
          children: <Widget>[
            Container(
              width: 50,
              height: 20,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('${widget.country.flag}'),
                )
              ),
              child: null,
            ),
            Text(
                '${widget.country.name}',
                style: TextStyle(
                color: Colors.white
              ),
            ),
          ],
        ),
        ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                Card(
                  color: Colors.white,
                  elevation: 3,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Container(
                    margin: EdgeInsets.all(16),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              color: Colors.purple,
                              height: 16,
                              width: 16,
                              child: null,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                                'Affected'
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              color: Colors.red,
                              height: 16,
                              width: 16,
                              child: null,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                                'Death'
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              color: Colors.green,
                              height: 16,
                              width: 16,
                              child: null,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                                'Recovered'
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: PieChart(
                                  PieChartData(
                                      sections: _data,
                                      borderData: FlBorderData(show: false)
                                  )
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.all(20),
                                child: Column(
                                  children: <Widget>[
                                    ChartRowWithLabel(
                                      text: '${widget.country.cases}',
                                      color: Colors.purple,
                                    ),
                                    ChartRowWithLabel(
                                      text: '${widget.country.deaths}',
                                      color: Colors.red,
                                    ),
                                    ChartRowWithLabel(
                                      text: '${widget.country.recovered}',
                                      color: Colors.green,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      RichTextLabel(
                        name: 'Total Cases: ',
                        value: widget.country.cases.toString(),
                      ),
                      Divider(
                        height: 3,
                      ),
                      RichTextLabel(
                        name: 'Total Death: ',
                        value: widget.country.deaths.toString(),
                      ),
                      Divider(
                        height: 3,
                      ),
                      RichTextLabel(
                        name: 'Recovered: ',
                        value: widget.country.recovered.toString(),
                      ),
                      Divider(
                        height: 3,
                      ),
                      RichTextLabel(
                        name: 'Today\'s Cases: ',
                        value: widget.country.todayCases.toString(),
                      ),
                      Divider(
                        height: 3,
                      ),
                      RichTextLabel(
                        name: 'Today\'s Deaths: ',
                        value: widget.country.todayDeaths.toString(),
                      ),
                      Divider(
                        height: 3,
                      ),
                      RichTextLabel(
                        name: 'Cases Per Million: ',
                        value: widget.country.casesPerOneMillion.toString(),
                      ),
                      Divider(
                        height: 3,
                      ),
                      RichTextLabel(
                        name: 'Deaths Per Million: ',
                        value: widget.country.deathsPerOneMillion.toString(),
                      ),
                      Divider(
                        height: 3,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              width: double.infinity,
              color: Colors.grey[500],
              height: 70,
              alignment: Alignment.center,
              child: Text(
                'Back',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}


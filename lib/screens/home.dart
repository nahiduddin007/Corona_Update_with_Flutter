import 'package:covid19cases/models/country.dart';
import 'package:covid19cases/network/network_helper.dart';
import 'package:covid19cases/screens/nutrition_guide.dart';
import 'package:covid19cases/screens/safety_suggestions.dart';
import 'package:covid19cases/screens/single_country.dart';
import 'package:covid19cases/screens/symptoms.dart';
import 'package:flutter/material.dart';

import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../utils/reuseable_widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  NetworkHelper _networkHelper = NetworkHelper();
  List<Country> _countries = [];
  List<Country> _countriesData = [];

  var totalAffected = 0;
  var totalDeath = 0;
  var totalRecovered = 0;

  bool isEnable = false;

  getAllData() async{
    var response = await _networkHelper.getAllData();
    setState(() {
      totalAffected = response['cases'];
      totalDeath = response['deaths'];
      totalRecovered = response['recovered'];
    });
  }

  getAllCountryData() async{
    var response = await _networkHelper.getAllCountryData();
    for (var res in response){
      Country country = Country(
        name: res['country'],
        flag: res['countryInfo']['flag'],
        cases: res['cases'],
        todayCases: res['todayCases'],
        deaths: res['deaths'],
        todayDeaths: res['todayDeaths'],
        recovered: res['recovered'],
        active: res['active'],
        critical: res['critical'],
        casesPerOneMillion: res['casesPerOneMillion'],
        deathsPerOneMillion: res['deathsPerOneMillion']
      );
      _countries.add(country);
    }
    setState(() {
      _countriesData = _countries;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startNetworkTasks();
  }

  startNetworkTasks()async{
    setState(() {
      isEnable = true;
    });
    await getAllData();
    await getAllCountryData();
    setState(() {
      isEnable = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black87
        ),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.symmetric(horizontal: 16),
            icon: Icon(Icons.search),
            onPressed: (){
              showSearch(context: context, delegate: DataSearch(country: _countriesData));
            },
          )
        ],
        backgroundColor: Colors.grey[300],
        elevation: 0,
        title: Center(
          child: Text(
            'COVID-19 Cases',
            style: TextStyle(
              color: Colors.black87
            ),
          ),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: isEnable,
        child: RefreshIndicator(
          color: Colors.lightBlue[800],
          onRefresh: ()async{
            await startNetworkTasks();
          },
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: DashboardCard(
                          title: 'Affected',
                          number: totalAffected.toString(),
                          color: Colors.purple,
                        ),
                      ),
                      Expanded(
                        child: DashboardCard(
                          title: 'Deaths',
                          number: totalDeath.toString(),
                          color: Colors.red,
                        ),
                      ),
                      Expanded(
                        child: DashboardCard(
                          title: 'Recovered',
                          number: totalRecovered.toString(),
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(
                child: Container(
                  child: ListView.builder(
                    itemCount: _countriesData.length,
                    itemBuilder: (context, index){
                      return Card(
                        child: ListTile(
                          onTap: (){
                            Navigator.push(
                              context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => SingleCountry(
                                        country: _countriesData[index]
                                    )
                                )
                            );
                          },
                          leading: Image.network(
                            '${_countriesData[index].flag}',
                          width: 50,
                          ),
                          title: Text(
                            '${_countriesData[index].name}'
                          ),
                          subtitle: Text(
                            'Cases : ${_countriesData[index].cases}\nDeaths : ${_countriesData[index].deaths}\nRecovered : ${_countriesData[index].recovered}  '
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.bottomLeft,
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/corona.jpg'),
                  fit: BoxFit.cover
                )
              ),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Text(
                  'Stay Home, Stay Safe',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.dashboard,
                color: Colors.blue,
              ),
              title: Text(
                'Home',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600
                ),
              ),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                  Icons.label_important
              ),
              title: Text(
                  'Symptoms of COVID-19'
              ),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) => Symptoms()
                ));

              },
            ),
            ListTile(
              leading: Icon(
                Icons.directions
              ),
              title: Text(
                'Safety Suggestions'
              ),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) => SafetySuggestions()
                ));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.fastfood
              ),
              title: Text(
                'Nutrition Guides'
              ),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) => NutritionGuide()
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}






class DataSearch extends SearchDelegate{
  DataSearch({@required this.country});

  final List<Country> country;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Country> suggestionList =[];
    suggestionList.clear();
    suggestionList = country.where((c) =>
        c.name.toString().toLowerCase().startsWith(query.toLowerCase())
    ).toList();
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ListTile(
                onTap: (){
                  close(context, null);
                  Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) => SingleCountry(country: suggestionList[index],)
                  ));
                },
                leading: Container(
                  width: 30,
                  child: Image.network(suggestionList[index].flag),
                ),
                title: Text(
                    '${suggestionList[index].name}'
                ),
              ),
              Divider(
                height: 1,
              )
            ],
          );
        }
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Country> suggestionList =[];
    if (query.isEmpty) {
      suggestionList = country;
    } else {
      suggestionList.clear();
      suggestionList = country.where((c) =>
          c.name.toString().toLowerCase().startsWith(query.toLowerCase())
      ).toList();
    }
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ListTile(
                  onTap: (){
                    close(context, null);
                    Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context) => SingleCountry(country: suggestionList[index],)
                    ));
                  },
                  leading: Container(
                    width: 30,
                    child: Image.network(suggestionList[index].flag),
                  ),
                  title: Text(
                      '${suggestionList[index].name}'
                  ),
                ),
                Divider(
                  height: 1,
                )
              ],
            );
          }
      );
    }
 }



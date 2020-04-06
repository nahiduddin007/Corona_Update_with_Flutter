import 'package:http/http.dart' as http;
import 'dart:convert';

const String baseUrl = 'https://corona.lmao.ninja/';
const String allUrl = baseUrl + 'all';
const String allCountryUrl = baseUrl + 'countries?sort=%7Bparameter%7D';
const String countryUrl = baseUrl + 'countries/';

class NetworkHelper{

  Future<dynamic> getAllData() async{
    try {
      var data = await http.get(allUrl);
      if (data.statusCode == 200) {
        return jsonDecode(data.body);
      }
      return data;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<dynamic> getAllCountryData() async{
    try{
      var data = await http.get(allCountryUrl);
      if (data.statusCode == 200){
        return jsonDecode(data.body);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<http.Response> getCountryData(String name) async{
    var data = await http.get(countryUrl + name);
    return data;
  }

}
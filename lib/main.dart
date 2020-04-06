import 'package:covid19cases/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

main() {
  runApp(CovidApp());
}

class CovidApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Sen'
      ),
      home: Home(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Symptoms extends StatefulWidget {
  @override
  _SymptomsState createState() => _SymptomsState();
}

class _SymptomsState extends State<Symptoms> {

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'nPfiM42MRzc'
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black87
        ),
        title: Text(
          'Symptoms of COVID-19',
          style: TextStyle(
            color: Colors.black87
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'What are the symptoms of COVID-19?',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'People may be sick with the virus for 1 to 14 days before developing symptoms. The most common symptoms of coronavirus disease (COVID-19) are fever, tiredness, and dry cough. Most people (about 80%) recover from the disease without needing special treatment.\n'
              ),
              Text(
                'More rarely, the disease can be serious and even fatal. Older people, and people with other medical conditions (such as asthma, diabetes, or heart disease), may be more vulnerable to becoming severely ill.\n'
              ),
              Text(
                'People may experience:',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  '1. Cough\n2. Fever\n3. Tiredness\n4. Difficulty breathing (severe cases)',
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                height: 200,
                width: double.infinity,
                child: YoutubePlayer(
                  controller: _controller,
                ),
              ),
              Text(
                '- All Information Collected from WHO',
                style: TextStyle(
                  fontStyle: FontStyle.italic
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

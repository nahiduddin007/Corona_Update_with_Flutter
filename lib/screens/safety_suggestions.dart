import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SafetySuggestions extends StatefulWidget {
  @override
  _SafetySuggestionsState createState() => _SafetySuggestionsState();
}

class _SafetySuggestionsState extends State<SafetySuggestions> {

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'bPITHEiFWLc',
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
          'Safety Suggestions',
          style: TextStyle(
            color: Colors.black87
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Basic protective measures against the new coronavirus',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Stay aware of the latest information on the COVID-19 outbreak, available on the WHO website and through your national and local public health authority. Most people who become infected experience mild illness and recover, but it can be more severe for others. Take care of your health and protect others by doing the following : "
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                width: double.infinity,
                height: 200,
                child: YoutubePlayer(
                  controller: _controller,
                ),
              ),
              Text(
                'Wash your hands frequently',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Regularly and thoroughly clean your hands with an alcohol-based hand rub or wash them with soap and water.\nWhy? Washing your hands with soap and water or using alcohol-based hand rub kills viruses that may be on your hands."
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Maintain social distancing',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Maintain at least 1 metre (3 feet) distance between yourself and anyone who is coughing or sneezing.\nWhy? When someone coughs or sneezes they spray small liquid droplets from their nose or mouth which may contain virus. If you are too close, you can breathe in the droplets, including the COVID-19 virus if the person coughing has the disease."
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Avoid touching eyes, nose and mouth',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Why? Hands touch many surfaces and can pick up viruses. Once contaminated, hands can transfer the virus to your eyes, nose or mouth. From there, the virus can enter your body and can make you sick."
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Practice respiratory hygiene',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Make sure you, and the people around you, follow good respiratory hygiene. This means covering your mouth and nose with your bent elbow or tissue when you cough or sneeze. Then dispose of the used tissue immediately.\nWhy? Droplets spread virus. By following good respiratory hygiene you protect the people around you from viruses such as cold, flu and COVID-19."
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'If you have fever, cough and difficulty breathing, seek medical care early',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Stay home if you feel unwell. If you have a fever, cough and difficulty breathing, seek medical attention and call in advance. Follow the directions of your local health authority.\nWhy? National and local authorities will have the most up to date information on the situation in your area. Calling in advance will allow your health care provider to quickly direct you to the right health facility. This will also protect you and help prevent spread of viruses and other infections."
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Stay informed and follow advice given by your healthcare provider',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                 "Stay informed on the latest developments about COVID-19. Follow advice given by your healthcare provider, your national and local public health authority or your employer on how to protect yourself and others from COVID-19. \nWhy? National and local authorities will have the most up to date information on whether COVID-19 is spreading in your area. They are best placed to advise on what people in your area should be doing to protect themselves."
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '- All Information Collected from WHO',
                style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}

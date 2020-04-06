import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NutritionGuide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
            color: Colors.black87
        ),
        title: Text(
          'Nutrition Guides',
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
                'Tips for eating healthier during the coronavirus lockdown',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Stress and uncertainty during the coronavirus pandemic might bring our worst eating habits to the surface. But there are ways to maintain a balanced diet at home with what you have in your pantry or freezer.',
                style: TextStyle(
                  fontStyle: FontStyle.italic
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'As people stock up and panic buy all sorts of groceries, from tinned food to toilet paper, you also might be wondering how you will handle healthy eating during the next 21 days.\nPlease note that we are not saying now is the ideal time to focus on weight-loss or completely changing your eating habits for the better – for most of us, these times are uncertain and scary. But focusing on food as a pillar of energy and health and not as a crutch for emotions, is a good idea.\nHere are some tips to navigate eating at home:'
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                height: 200,
                child: Image.asset('assets/images/heath.jpg',
                fit: BoxFit.fill,),
              ),
              Text(
                '1. Immunity and health first, weight later',
                style: TextStyle(
                    fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'While the country is in the grips of fear and uncertainty, the last thing you want to add to that is shame about your body and weight. You need to make a shift in your attitude during this time. You want to eat to honour your body and to keep all systems functioning as well as possible, not because you want to emerge from this lockdown looking fabulous.\n\nTell yourself during this time, “I need to eat healthy, balanced meals as much as possible, not because I’m scared of weight-gain, but want to stay healthy in a time when our health can be compromised.”'
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '2. Pantry staples can be healthy',
                style: TextStyle(
                    fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Yes, it’s going to be harder during this time to buy fresh produce daily. But that doesn’t mean you should shun healthy eating immediately. There is evidence that frozen fruit and vegetables can be just as beneficial to you as fresh. Here are quick tips to healthy pantry staples:'
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: Text(
                  '1. Choose whole grain pasta or brown rice.\n\n2. Tinned tomatoes and tomato paste can add great flavour to soups and stews.\n\n3. Legumes such as beans and lentils are packed with protein and fibre, and can add texture and flavour to sauces, soups and stews.\n\n4. Don’t forget the fish. Oily fish such as tinned mackerel or tuna is high in omega fatty acids, which keeps your body and mind healthy.\n\n5. If you are a snacker, especially while working from home, dried fruit and nuts are a more nutritious alternative than sweets and biscuits, and will help sustain energy for longer.',
                  softWrap: true,
                ),
              ),
              Text(
                '3. Set a routine – and stick to it',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'For the first couple of days, lockdown might feel like the beginning of a long weekend for some – but this doesn’t mean that you should eat accordingly. If you shopped ahead, scan your pantry and fridge and plan your meals, at least for the next week. Also try to eat at set times. This will create a sense of normality and will keep you and your family from reaching for biscuits and crisps at random times.'
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '4. No takeaway? Let the challenge begin',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Always relied on takeaway meals? Unfortunately, we are denied this convenience during our state of lockdown as takeaway restaurants will be closed and delivery services will not be operating. Now is the time to get creative with what you have on hand. Search for new recipes to try and get the children involved as you prepare a meal from scratch.\nWe are realistic and we know that is easier said than done – especially if your circumstances never allowed for home cooking.\nOur nutritional experts put together a list of store-bought ready-made meals that are not completely unhealthy – these options might still be available in supermarkets.\nOr why not use the time to recreate your favourite takeaway treat – but make it healthy? Here are some tips:"
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: Text(
                '1. Make baked sweet potato or potato wedges with a drizzle of olive oil, sea salt and rosemary.\n\n2.Stock up on frozen pizza bases and top them with tomato sauce and some of your favourite vegetables and lean meat such as shredded chicken.\n\n3. Cook homemade curry as you can freeze the leftovers for another day.',
                  softWrap: true,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '- These tips are given by heath24.com',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.black87
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

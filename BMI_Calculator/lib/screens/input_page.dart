import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/cardWidget.dart';
import '../components/cardContentWidget.dart';
import '../constants.dart';
import '../components/bottom_button.dart';
import 'package:bmi_calculator/calculate_brain.dart';
import 'results_page.dart';
enum gender {
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  gender selectedGender;
  void paintCard(){
    Container(
        margin: EdgeInsets.all(15.0),
    decoration: BoxDecoration(
    color: Color(0xFF1D1E33),
    borderRadius: BorderRadius.circular(5.0),

    ),
    );
  }
  void onGenderCardTap(gender inputGender){
    setState(() {
      selectedGender = inputGender;
    });
  }
  int height = 180;
  int weight = 60;
  int age=20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Expanded(child: Row(
            children: [
              Expanded(
                  child: resuableCode(
                    onPress: (){
                      setState(() {
                        selectedGender = gender.male;
                      });
                    },
                      colour: selectedGender == gender.male ? kActiveCardColor : kInactiveCardColor,

                    cardChild: cardContent1(
                      icon: FontAwesomeIcons.mars,
                      text: 'MALE',
                    ),
                  )
              ),
              Expanded(
                  child: resuableCode(
                    onPress: (){
                      setState(() {
                        selectedGender = gender.female;
                      });
                    },
                      colour: selectedGender == gender.female ? kActiveCardColor : kInactiveCardColor,
                    cardChild: cardContent1(
                      icon: FontAwesomeIcons.venus,
                      text: 'FEMALE',
                    ),
                  )
              ),
            ],
          )),
          Expanded(
              child:resuableCode(
                  colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: kTextStyleCustom,


                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberStyle,
                        ),
                        Text(
                          'cm',
                          style: kTextStyleCustom,
                        )
                      ],

                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: kActiveSliderColor,
                        overlayColor: Color(0x29EB1555),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98)
                      ),
                      child: Slider(
                        min: 100,
                        max: 220,
                        value: height.toDouble(),
                        onChanged: (double newValue){
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              )
          ),
          Expanded(child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: resuableCode(
                    colour: kActiveCardColor,
                  cardChild: Column(
                    children: [
                      Text(
                        'WEIGHT',
                        style: kTextStyleCustom,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundedIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                weight++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                )

              ),
              Expanded(
                child: resuableCode(
                    colour: kActiveCardColor,
                  cardChild: Column(
                    children: [
                      Text(
                        'AGE',
                        style: kTextStyleCustom,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundedIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                age++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),

                ),
              )
            ],
          )),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: (){
              CalculateBrain cal = CalculateBrain(height: height,weight: weight);
              Navigator.push(context, MaterialPageRoute( builder: (context) => Results(bmi: cal.calculateBMI(), interpretation: cal.getInterpretation(), result: cal.getResult()))
              );
            },
          )
        ],
      )
    );
  }
}



class RoundedIconButton extends StatelessWidget {
  @override
  final IconData icon;
  final Function onPressed;
  RoundedIconButton({@required this.icon, @required this.onPressed});
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      child: Icon(icon),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints(minWidth: 56.0, minHeight: 56.0),
     onPressed: onPressed,
      elevation: 6.0,

    );
  }
}

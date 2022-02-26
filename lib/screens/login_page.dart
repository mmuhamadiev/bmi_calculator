import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';
import 'result_page.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constraints.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender {
  male,
  female,
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Gender? selectedGender;
  int height = 180;
  int age = 18;
  int weight = 65;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Login via BMI calculator',
          style: TextStyle(
              color: Colors.green, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      cardChild: IconContent(
                        icon: Icons.male,
                        label: 'Male',
                      ),
                      colour: selectedGender == Gender.male
                          ? kActiveColor
                          : kInactiveColor),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    cardChild: IconContent(
                      icon: Icons.female,
                      label: 'Female',
                    ),
                    colour: selectedGender == Gender.female
                        ? kActiveColor
                        : kInactiveColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '$height',
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                    ),
                    child: Slider(
                      activeColor: Colors.green,
                      inactiveColor: Color(0xFF8D8E98),
                      value: height.toDouble(),
                      min: 50,
                      max: 220,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
              colour: kActiveColor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: kTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$weight',
                              style: kNumberTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              func: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              func: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    colour: kActiveColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: kTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$age',
                              style: kNumberTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              func: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              func: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    colour: kActiveColor,
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonText: 'Login',
            onPress: () {
              CalculatorBrain calcBrain = CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResultPage(
                  bmiResult: calcBrain.calculateBMI(),
                  bmiResultText: calcBrain.getResult(),
                  interpretation: calcBrain.getResultInterpretation(),
                ),),
              );
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:bmi_calculator/constraints.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

class ResultPage extends StatelessWidget {

  ResultPage({required this.bmiResult, required this.bmiResultText, required this.interpretation});

  final String bmiResult;
  final String bmiResultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Welcome'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(
                'Your Result',
                style: kResultTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('${bmiResultText.toUpperCase()}', style: kResultSmallTextStyle),
                  Text('$bmiResult', style: kResultLargeTextStyle),
                  Text('$interpretation', style: kResultSmallTextStyle,textAlign: TextAlign.center,),
                ],
              ),
            ),
          ),
          BottomButton(onPress: () {Navigator.pop(context);}, buttonText: 'Re-Calculate')
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reuseable_card.dart';

const bottonContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottonCardContainerColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;

  void updateColor(int gender) {
    setState(() {
      if (gender == 1) {
        if (maleCardColor == inactiveCardColor) {
          maleCardColor = activeCardColor;
          femaleCardColor = inactiveCardColor;
        } else {
          maleCardColor = inactiveCardColor;
        }
      } else if (gender == 2) {
        if (femaleCardColor == inactiveCardColor) {
          femaleCardColor = activeCardColor;
          maleCardColor = inactiveCardColor;
        } else {
          femaleCardColor = inactiveCardColor;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      updateColor(1);
                    },
                    child: ReuseableCard(
                      colour: maleCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      updateColor(2);
                    },
                    child: ReuseableCard(
                      colour: femaleCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReuseableCard(
              colour: inactiveCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    colour: inactiveCardColor,
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    colour: inactiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: bottonCardContainerColor,
            height: bottonContainerHeight,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}

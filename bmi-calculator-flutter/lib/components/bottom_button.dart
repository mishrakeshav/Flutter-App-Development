import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {
  final String buttonTitle;
  final Function onTap;
  BottomButton({this.buttonTitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButtonTextStyle,
          ),
        ),
        padding: EdgeInsets.only(bottom: 20.0),
        color: kbottonCardContainerColor,
        height: kbottonContainerHeight,
        width: double.infinity,
      ),
    );
  }
}

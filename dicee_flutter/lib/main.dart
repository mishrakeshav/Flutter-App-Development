import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  void setDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          //the expanded widget is analogous
          //to container-fluid
          Expanded(
            
            child: FlatButton(
              onPressed: () {
                setDice();
              },
              //asset is an attribute of Image class
            //which helps to reduce LOC
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {
                setDice();
              },
              child: Image.asset('images/dice$rightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}

// class DicePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Row(
//         children: <Widget>[
//           //the expanded widget is analogous
//           //to container-fluid
//           Expanded(
//             //asset is an attribute of Image class
//             //which helps to reduce LOC
//             child: FlatButton(
//               onPressed: (){
//                 print("Left Button got pressed");
//               },
//               child: Image.asset('images/dice1.png'),
//             ),
//           ),
//           Expanded(
//             child: FlatButton(
//               onPressed: (){
//                 print("Right Button got pressed");
//               },
//               child: Image.asset('images/dice1.png'),
//               ),
//           ),
//         ],
//       ),
//     );
//   }
// }

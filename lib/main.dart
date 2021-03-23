import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text('Dicee'),
          centerTitle: true,
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
  int leftDiceNumber = (Random.secure().nextInt(6))+1;
  int rightDiceNumber = (Random.secure().nextInt(6))+1;
  var rollText = 'You have not yet rolled the dice.';
  void printDice() {
    int totalDice = leftDiceNumber + rightDiceNumber;
    if(leftDiceNumber==rightDiceNumber) {
      rollText = 'You have rolled doubles of $leftDiceNumber . \n This means that you rolled $totalDice.';
    } else {
      rollText = 'You have rolled $leftDiceNumber and $rightDiceNumber . \n This means that you rolled $totalDice.';
    }
  }
  void rollDice() {
    leftDiceNumber = (Random.secure().nextInt(6))+1;
    rightDiceNumber = (Random.secure().nextInt(6))+1;
    printDice();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(4.0),
            child: Text(
              'Press the button to roll the two dice!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32.0,
                color: Colors.yellowAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset('images/dice$leftDiceNumber.png'),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset('images/dice$rightDiceNumber.png'),
                  ),
                ),
              ],
            ),
          ),
          Text(
            '$rollText',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.yellowAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          FlatButton(
              onPressed: () {
                setState(() {
                  rollDice();
                });
              },
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  ' Roll the dice. ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32.0,
                    color: Colors.indigoAccent,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.yellowAccent,
                  ),
                ),
              ),
          ),
        ],
      ),
    );
  }
}

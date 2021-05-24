// Rock ==> 0
// Paper ==> 1
// Scissors ==> 2

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rock_paper_scissors/scoreboard.dart';
import 'package:rock_paper_scissors/game_over.dart';
import 'dart:math';
void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String text='', computer = '', user = '';
  int userPoint = 0, compPoint = 0, chance = 7;
  void _resetGame(){
    setState(() {
      chance = 7;
      userPoint = 0;
      compPoint = 0;
      computer = '';
      user = '';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      body: chance > 0
        ? SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Text('  Rock Paper Scissors  ',style:TextStyle(
                  fontFamily: 'Pacifico',
                  backgroundColor: Colors.red[500],
                  letterSpacing: 1,
                  shadows: [
                    Shadow(
                        color: Colors.red[900],
                        offset: Offset.fromDirection(10,4)
                    )
                  ],
                  fontSize: 23,
                  color: Colors.white
              ),),
              SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                          onPressed: (){
                            buttonOnPressed(2);
                            setState(() {
                              chance -= 1;
                            });
                            print(chance);
                          },
                          child: Image.asset('images/scissors.png')
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                          onPressed: (){
                            buttonOnPressed(0);
                            setState(() {
                              chance -= 1;
                            });
                          },
                          child: Image.asset('images/stone.png')
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: TextButton(
                      onPressed: (){
                        buttonOnPressed(1);
                        setState(() {
                          chance -= 1;
                        });
                      },
                      child: Image.asset('images/paper.png')
                  )
              ),
              ScoreBoard('Computer Chooses $computer',user,userPoint,compPoint),
            ],
          ),
        )
    )
     : GameOver(userPoint, compPoint, _resetGame)
    );
  
  }
  void buttonOnPressed(int userChoice){
    int compChoice = Random().nextInt(3);
    if(userChoice == 0){
      setState(() {
        user = 'Rock';
      });
      if(compChoice == 0){
        setState(() {
          computer = 'Rock';
        });
      }
      else if(compChoice == 1){
        setState(() {
          computer = 'Paper';
          compPoint++;
        });
      }
      else if(compChoice == 2){
        setState(() {
          userPoint++;
          computer = 'Scissor';
        });
      }
    }
    if(userChoice == 1){
      setState(() {
        user = 'Paper';
      });
      if(compChoice == 0){
        setState(() {
          computer = 'Rock';
          userPoint++;
        });
      }
      else if(compChoice == 1){
        setState(() {
          computer = 'Rock';
        });
      }
      else if(compChoice == 2){
        setState(() {
          computer = 'Scissor';
          compPoint++;
        });
      }
    }
    if(userChoice == 2){
      setState(() {
        user = 'Scissor';
      });
      if(compChoice == 0){
        setState(() {
          computer = 'Rock';
          compPoint++;
        });
      }
      else if(compChoice == 1){
        setState(() {
          computer = 'Paper';
          userPoint++;
        });
      }
      else if(compChoice == 2){
        setState(() {
          computer = 'Scissor';
        });
      }
    }
    print("$userChoice $compChoice ");
  }
}


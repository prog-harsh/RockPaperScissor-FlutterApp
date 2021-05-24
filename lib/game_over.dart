import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GameOver extends StatelessWidget {
  final int userPoint, compPoint;
  final Function resetGame;

  GameOver(this.userPoint,this.compPoint, this.resetGame);
  @override
  Widget build(BuildContext context) {
    String _winner;
    if(userPoint > compPoint){
      _winner = 'Horray You Win';
    }
    else if(userPoint < compPoint){
      _winner = 'Bad Luck You Loss';
    }
    else{
      _winner = 'Match Draw';
    }
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(_winner,style: TextStyle(
            fontSize: 28,
            shadows: [
              Shadow(
                  color: Colors.blueAccent,
                  offset: Offset.fromDirection(10,2)
              )
            ],
            color: Colors.white,
            fontFamily: 'SourceSansPro',
          ),),
          SizedBox(
            height: 15,
          ),
          Text('User Points = $userPoint',style: TextStyle(
            fontSize: 15,
            color: Colors.red[400],
            fontWeight: FontWeight.bold,
            fontFamily: 'SourceSansPro',
          ),),
          Text('Computer Points = $compPoint',style: TextStyle(
            fontSize: 15,
            color: Colors.red[400],
            fontWeight: FontWeight.bold,
            fontFamily: 'SourceSansPro',
          ),),
          SizedBox(
            height: 100,
          ),
          ElevatedButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.red[400],
              elevation: 8,

            ),
            onPressed: resetGame,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('Play Again'),
            ),
          ),
        ],
      ),
    );
  }
}

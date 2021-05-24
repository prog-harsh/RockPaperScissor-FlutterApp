import 'package:flutter/material.dart';
class ScoreBoard extends StatelessWidget {
  final String computer, user;
  final int compPoint, userPoint;
  ScoreBoard(this.computer, this.user, this.userPoint, this.compPoint);

  @override
  Widget build(BuildContext context) {

    return Expanded(
        flex:2,
        child:Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 50),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
                children: [
              Text('$computer\n\n User Points $userPoint\nComputer Points = $compPoint',textAlign: TextAlign.center,style:TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'SourceSansPro',
                shadows: [
                  Shadow(
                    color: Colors.blueAccent,
                    offset: Offset.fromDirection(10,2)
                  )
                ]
              ),),

            ]
            ),
          ),
        )
    );
  }
}

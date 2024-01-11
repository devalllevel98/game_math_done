import 'dart:io';

import 'package:flutter/material.dart';
import 'package:matz/bu.dart';
import 'package:matz/gui.dart';
import 'package:matz/menu.dart';

import 'Buttons.dart';
import 'PlayScreenScore.dart';
import 'PlayScreenTopBar.dart';

class PlayScreenBody extends StatelessWidget {
  final String level;
  final bool isGameOver;
  final int score;
  final String questionText;
  final void Function() onRetryTap;
  final void Function(bool) onYesNoTap;

  const PlayScreenBody({
    super.key,
    required this.level,
    required this.isGameOver,
    required this.score,
    required this.questionText,
    required this.onRetryTap,
    required this.onYesNoTap,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Colors.transparent,
      //   titleSpacing: 0,
      //   title: PlayScreenTopBar(
      //     level: level,
      //   ),
      // ),
      body: Stack(
        children: [
        Bubbles(numberOfBubbles: 400, maxBubbleSize: 4),
      Column(
        children: [
          SizedBox(height: 28,),
          PlayScreenScore(
            score: score,
            isGameOver: isGameOver,
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                isGameOver ? 'Game Over ' : questionText,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 40,
                  color: Color(0xffffffff),
                  letterSpacing: 0.08,
                  fontWeight: FontWeight.w500,

                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Expanded(
            child: !isGameOver
                ? YesNoButton(
                    onTap: onYesNoTap,
                  ): Text(""),
          ),
          PlayScreenTopBar(
          level: level,
        ),
           Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    child: const Text('Back Menu', 
                    style: TextStyle(
                      color:  Color.fromARGB(255, 12, 105, 122),
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                    ),),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MenuScreen()),
                      );
                    },
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 119, 241, 102),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                  ),
                  ElevatedButton(
                    child: const Text('Guideline', 
                    style: TextStyle(
                      color:  Color.fromARGB(255, 12, 105, 122),
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                    ),),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Guiline()),
                      );
                    },
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 223, 220, 56),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                  ),

              ],
            ),
          SizedBox(height: 10,),
            Row(
              mainAxisAlignment: isGameOver? MainAxisAlignment.spaceEvenly: MainAxisAlignment.center,
              children: [
                isGameOver ?ElevatedButton(
                    child: const Text('Play Again', 
                    style: TextStyle(
                      color:  Color.fromARGB(255, 255, 255, 255),
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                    ),),
                onPressed: () {
                  onRetryTap();
                    },
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 21, 0, 255),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                  )
                
                // RetryButton(
                //     onTap: onRetryTap,
                //   )
                  : Text(""),
                ElevatedButton(
                    child: const Text('Quit App', 
                    style: TextStyle(
                      color:  Color.fromARGB(255, 192, 216, 220),
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                    ),),
                onPressed: () {
                  exit(0);
                    },
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 237, 135, 135),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                  ),
              ],
            ),
         
              ],
            ),
            
          ),
        ],
      ),
    

        ],
      ),

    );
  }
}

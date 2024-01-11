import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:matz/bu.dart';
import 'package:matz/constants.dart';
import 'package:matz/data/Level.dart';
import 'package:matz/menu.dart';
import 'package:matz/widgets/Buttons.dart';
import 'package:matz/widgets/HomeScreenImage.dart';
import 'package:matz/widgets/HomeTopScoreLevelBar.dart';
import 'package:matz/widgets/RulesText.dart';
import 'package:provider/provider.dart';

import 'Play.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String currentLevel;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.initState();
    currentLevel = Provider.of<Level>(context, listen: false).lastPlayedLevel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: kScaffoldBackgroundColor,
        title: HomeTopScoreLevelBar(
          onChangeLevel: (String level) {
            setState(() {
              currentLevel = level;
            });
          },
        ),
      ),
      body: Stack(

        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16*2),
            child: Lottie.asset('assets/lotties/elements.json', repeat: true,reverse: true),
          ),
          Bubbles(numberOfBubbles: 400, maxBubbleSize: 4),
          Column(
            children: [
              const SizedBox(height: 64,),
              HomeScreenImage(
                level: currentLevel,
              ),
              const SizedBox(height: 72,),
              PlayNowButton(
                onTap: () {
                  Provider.of<Level>(context, listen: false)
                      .setLastPlayedLevel(currentLevel);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Play(
                        level: currentLevel,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20,),
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
                              primary: Color.fromARGB(255, 255, 255, 255),
                              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                          ),
                            ),
              

              const Spacer(),
              RulesText(
                level: currentLevel,
              ),
              // Text(''),
              const SizedBox(height: 16),

            ],
          ),

          
        ],
      ),
    );
  }
}

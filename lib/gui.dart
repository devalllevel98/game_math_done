

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:matz/menu.dart';


class Guiline extends StatefulWidget {
  // const Guiline({Key? key}) : super(key: key);

  @override
  State<Guiline> createState() => _GuilineState();
}

class _GuilineState extends State<Guiline> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Guideline',
              style: TextStyle(
                color: Color.fromARGB(255, 239, 236, 236),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              )),
          backgroundColor: Color.fromARGB(255, 25, 28, 33),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: const Color.fromARGB(255, 254, 249, 249)),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MenuScreen()),
              );
            },
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Positioned.fill(
                child: Image.asset(
              "assets/gui.png",
              fit: BoxFit.fill,
            ))
          ],
        ),
      ),
    );
  }
}

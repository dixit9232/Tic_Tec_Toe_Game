import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:particles_flutter/particles_flutter.dart';
import 'package:tic_tec_toe/multiplayer.dart';
import 'package:tic_tec_toe/singleplayer.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: tic_tec_toe(),

  ));
}

class tic_tec_toe extends StatefulWidget {
  const tic_tec_toe({super.key});

  State<tic_tec_toe> createState() => _tic_tec_toeState();
}

class _tic_tec_toeState extends State<tic_tec_toe> {
  Widget Partical() {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return CircularParticle(
      height: h,
      width: w,
      isRandomColor: false,
      particleColor: Colors.white,
      maxParticleSize: 1.5,
      isRandSize: true,
      onTapAnimation: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Partical(),
          SafeArea(
              child: Column(
            children: [
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Tic Tec Toe",
                    style: GoogleFonts.orbitron(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                              color: Colors.grey,
                              blurRadius: 10,
                              offset: Offset(2, 2)),Shadow(
                              color: Colors.grey,
                              blurRadius: 10,
                              offset: Offset(-2, -2))
                        ]),
                  )
                ],
              ),
            ],
          )),
          Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              NeumorphicButton(
                  style: NeumorphicStyle(
                    color: Colors.black,
                    shadowDarkColor: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                        builder: (context) {
                          return Singleplayer();
                        },
                      ),(route) => true);
                    });
                  },
                  child: Text(
                    "Single Player",
                    style: GoogleFonts.orbitron(textStyle: TextStyle(fontSize: 25, color: Colors.white)),
                  )),
              SizedBox(height: 50),
              NeumorphicButton(
                  style: NeumorphicStyle(
                    color: Colors.black,
                    shadowDarkColor: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                        builder: (context) {
                          return Multiplayer();
                        },
                      ),(route) => true);
                    });
                  },
                  child: Text(
                    "Multi Player",
                    style: GoogleFonts.orbitron(textStyle: TextStyle(fontSize: 26, color: Colors.white)),
                  )),
            ]),
          ),
        ],
      ),
    );
  }
}

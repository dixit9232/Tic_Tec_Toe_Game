import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:particles_flutter/particles_flutter.dart';
import 'package:tic_tec_toe/main.dart';

class Multiplayer extends StatefulWidget {
  const Multiplayer({super.key});

  State<Multiplayer> createState() => _MultiplayerState();
}

class _MultiplayerState extends State<Multiplayer> {
  var a = ["", "", "", "", "", "", "", "", ""];
  var cnt = 0;
  var temp = false;
  var Winner = "";

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

  fun(int i) {
    if (cnt % 2 == 0) {
      if (a[i] == "") {
        a[i] = "X";
        cnt++;
        win();
      }
    } else {
      if (a[i] == "") {
        a[i] = "O";
        cnt++;
        win();
      }
    }
    setState(() {});
  }

  win() {
    if (a[0] == "X" && a[1] == "X" && a[2] == "X" ||
        a[3] == "X" && a[4] == "X" && a[5] == "X" ||
        a[6] == "X" && a[7] == "X" && a[8] == "X" ||
        a[0] == "X" && a[4] == "X" && a[8] == "X" ||
        a[2] == "X" && a[4] == "X" && a[6] == "X" ||
        a[0] == "X" && a[3] == "X" && a[6] == "X" ||
        a[1] == "X" && a[4] == "X" && a[7] == "X" ||
        a[2] == "X" && a[5] == "X" && a[8] == "X") {
      Winner = "X is Winner";
      temp = true;
    } else if (a[0] == "O" && a[1] == "O" && a[2] == "O" ||
        a[3] == "O" && a[4] == "O" && a[5] == "O" ||
        a[6] == "O" && a[7] == "O" && a[8] == "O" ||
        a[0] == "O" && a[4] == "O" && a[8] == "O" ||
        a[2] == "O" && a[4] == "O" && a[6] == "O" ||
        a[0] == "O" && a[3] == "O" && a[6] == "O" ||
        a[1] == "O" && a[4] == "O" && a[7] == "O" ||
        a[2] == "O" && a[5] == "O" && a[8] == "O") {
      Winner = "O is Winner";
      temp = true;
    } else if (a[0] != "" &&
        a[1] != "" &&
        a[2] != "" &&
        a[3] != "" &&
        a[4] != "" &&
        a[5] != "" &&
        a[6] != "" &&
        a[7] != "" &&
        a[8] != "") {
      Winner = "Match Draw";
      temp = true;
    }
    setState(() {});
  }

  reset() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        a[i] = "";
      }
      Winner = "";
      temp = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Partical(),
          SizedBox(height: 30),
          SafeArea(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                          builder: (context) {
                            return tic_tec_toe();
                          },
                        ), (route) => true);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      )),
                ),
                SizedBox(width: 30),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: (temp)
                      ? Text(
                          "$Winner",
                          style: GoogleFonts.orbitron(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 35)),
                        )
                      : Text(
                          "Multi Player",
                          style: GoogleFonts.orbitron(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 35)),
                        ),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => (temp == false) ? fun(0) : null,
                      child: Container(
                        height: 100,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: BorderDirectional(
                                end: BorderSide(width: 5, color: Colors.grey),
                                bottom:
                                    BorderSide(color: Colors.white, width: 5))),
                        child: Text(
                          "${a[0]}",
                          style: GoogleFonts.orbitron(textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 80,
                              color: Colors.white),)
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => (temp == false) ? fun(1) : null,
                      child: Container(
                        height: 100,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: BorderDirectional(
                                end: BorderSide(width: 5, color: Colors.grey),
                                bottom:
                                    BorderSide(color: Colors.white, width: 5))),
                        child: Text(
                          "${a[1]}",
                          style: GoogleFonts.orbitron(textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 80,
                              color: Colors.white),)
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => (temp == false) ? fun(2) : null,
                      child: Container(
                        height: 100,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: BorderDirectional(
                                bottom:
                                    BorderSide(color: Colors.white, width: 5))),
                        child: Text(
                          "${a[2]}",
                          style: GoogleFonts.orbitron(textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 80,
                              color: Colors.white),)
                        ),
                      ),
                    ),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => (temp == false) ? fun(3) : null,
                      child: Container(
                        height: 100,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: BorderDirectional(
                                end: BorderSide(width: 5, color: Colors.grey),
                                bottom:
                                    BorderSide(color: Colors.white, width: 5))),
                        child: Text(
                          "${a[3]}",
                          style: GoogleFonts.orbitron(textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 80,
                              color: Colors.white),)
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => (temp == false) ? fun(4) : null,
                      child: Container(
                        height: 100,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: BorderDirectional(
                                end: BorderSide(width: 5, color: Colors.grey),
                                bottom:
                                    BorderSide(color: Colors.white, width: 5))),
                        child: Text(
                          "${a[4]}",
                          style: GoogleFonts.orbitron(textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 80,
                              color: Colors.white),)
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => (temp == false) ? fun(5) : null,
                      child: Container(
                        height: 100,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: BorderDirectional(
                                bottom:
                                    BorderSide(color: Colors.white, width: 5))),
                        child: Text(
                          "${a[5]}",
                          style: GoogleFonts.orbitron(textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 80,
                              color: Colors.white),)
                        ),
                      ),
                    ),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => (temp == false) ? fun(6) : null,
                      child: Container(
                        height: 100,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: BorderDirectional(
                                end: BorderSide(width: 5, color: Colors.grey),
                                )),
                        child: Text(
                          "${a[6]}",
                          style: GoogleFonts.orbitron(textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 80,
                              color: Colors.white),)
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => (temp == false) ? fun(7) : null,
                      child: Container(
                        height: 100,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: BorderDirectional(
                                end: BorderSide(width: 5, color: Colors.grey),
                               )),
                        child: Text(
                          "${a[7]}",
                          style: GoogleFonts.orbitron(textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 80,
                              color: Colors.white),)
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => (temp == false) ? fun(8) : null,
                      child: Container(
                        height: 100,
                        width: 100,
                        alignment: Alignment.center,
                        child: Text(
                          "${a[8]}",
                          style: GoogleFonts.orbitron(textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 80,
                              color: Colors.white),)
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment(0.0, 0.8),
            child: NeumorphicButton(
              onPressed: () {
                setState(() {
                  for (int i = 0; i < 9; i++) {
                    a[i] = "";
                  }
                  cnt = 0;
                  Winner = "";
                  temp = false;
                });
              },
              child: Text(
                  "Reset",
                  style: GoogleFonts.orbitron(textStyle: TextStyle(
                      fontSize: 30,
                      color: Colors.white),)
              ),
              style: NeumorphicStyle(
                color: Colors.black,
                shadowDarkColor: Colors.grey,
              ),),
          )
        ],
      ),
    );
  }
}

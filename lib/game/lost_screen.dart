// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:box_coloring_game/game/lunch_game.dart';
import 'package:box_coloring_game/game/play_screen.dart';
import 'package:box_coloring_game/model/level.dart';
import 'package:box_coloring_game/repository/boxes.dart';
import 'package:flutter/material.dart';

import '../model/state.dart';

class LostScreen extends StatefulWidget {
  final Stats stats;

  const LostScreen({
    super.key,
    required this.stats,
  });
  @override
  State<LostScreen> createState() => _LostScreenState();
}

class _LostScreenState extends State<LostScreen> {
  late Stats stats;
  @override
  void initState() {
    super.initState();
    stats = widget.stats;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage("assets/images/map.jpg"))),
      child: Scaffold(
        backgroundColor: Color(0XFF3b1390),
        body: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'lost',
                        style: TextStyle(
                          fontSize: 79,
                          color: Colors.yellowAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        " State|level${stats.level},score:${stats.score}/${stats.points},status${stats.statuse}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.yellowAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                height: MediaQuery.of(context).size.height * 0.32,
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage(
                      stats.level % 2 == 0
                          ? "assets/images/wrong.png"
                          : "assets/images/wrong2.png",
                    ),
                  ),
                ),
              ),

              //nextLevel  btn
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Color(0XFFffff15),
                  ),
                ),
                margin: EdgeInsets.only(
                  top: 20,
                  right: 5,
                  left: 5,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 2,
                ),
                child: InkWell(
                  // onTap: () {
                  //   double prevLevel = stats.level - 1;

                  //   Widget screen;
                  //   if (prevLevel > 0) {
                  //     screen = PlayScreen(
                  //       level: Level(
                  //         id: prevLevel,
                  //         duration: Boxes().levelDuration(prevLevel),
                  //         points: Boxes().levelPoints(prevLevel),
                  //       ),
                  //     );
                  //   } else {
                  //     screen = LaunchScreen();
                  //   }
                  //   LaunchScreen();
                  // },
                  onTap: () => _loadScreen(LaunchScreen()),
                  child: Text(
                    'resset',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.yellowAccent,
                    ),
                  ),
                ),
              ),

              // // المستوى السابق btn
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Color(0XFFffff15),
                  ),
                ),
                margin: EdgeInsets.only(
                  top: 20,
                  right: 5,
                  left: 5,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 2,
                ),
                child: InkWell(
                  onTap: () {
                    // double preventLevel = stats.level - 1;
                    double preventLevel = stats.level.toDouble();
                    // double preventLevel =  removeTrailPoints(preventLevel).toDouble();
                    Widget screen;

                    if (preventLevel > 0) {
                      screen = PlayScreen(
                          level: Level(
                        id: preventLevel,
                        duration: Boxes().levelDuration(preventLevel),
                        points: Boxes().levelPoints(preventLevel),
                      ));
                    } else {
                      screen = LaunchScreen();
                    }
                    _loadScreen(screen);
                  },
                  child: Text(
                    'pervent',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.yellowAccent,
                    ),
                  ),
                ),
              ),

              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Color(0XFFffff15),
                  ),
                ),
                margin: EdgeInsets.only(
                  top: 20,
                  right: 5,
                  left: 5,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 2,
                ),
                child: InkWell(
                  onTap: () {
                    //just for test this line doing
                    double preventLevel = stats.level - -1;
                    Widget screen;

                    if (preventLevel > 0) {
                      screen = PlayScreen(
                          level: Level(
                        id: preventLevel,
                        duration: Boxes().levelDuration(preventLevel),
                        points: Boxes().levelPoints(preventLevel),
                      ));
                    } else {
                      screen = LaunchScreen();
                    }
                    _loadScreen(screen);
                  },
                  child: Text(
                    'next level test',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.yellowAccent,
                    ),
                  ),
                ),
              ),

              //resset  btn
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.green,
                  ),
                ),
                margin: EdgeInsets.only(
                  top: 15,
                  right: 5,
                  left: 5,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 2,
                ),
                child: InkWell(
                  onTap: () => _loadScreen(LaunchScreen()),
                  child: Text(
                    'Resset',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// num removeTrailPoints(double val) {
//     return val % 1 == 0 ? val.toInt() : val;
//   }
  _loadScreen(Widget screen) {
    Navigator.of(context).pop();
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }
}

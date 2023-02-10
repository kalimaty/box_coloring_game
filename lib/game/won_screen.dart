// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:box_coloring_game/game/lunch_game.dart';
import 'package:box_coloring_game/game/play_screen.dart';
import 'package:box_coloring_game/model/level.dart';
import 'package:box_coloring_game/repository/boxes.dart';
import 'package:flutter/material.dart';

import '../model/state.dart';

class WinScreen extends StatefulWidget {
  final Stats stats;

  const WinScreen({
    super.key,
    required this.stats, // يستقبل بيانات النتيجة  لصفحة اعلان الفوز
  });
  @override
  State<WinScreen> createState() => _WinScreenState();
}

class _WinScreenState extends State<WinScreen> {
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
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'W o o h !',
                      style: TextStyle(
                        fontSize: 60,
                        color: Colors.yellowAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      " State|level ${stats.level},score :${stats.score}/${stats.points},status ${stats.statuse}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.yellowAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  height: MediaQuery.of(context).size.height * 0.42,
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 5, color: Colors.white),

                    // shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(stats.level % 2 == 0
                          ? "assets/images/win.png"
                          : "assets/images/winn.jpg"),
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
                  onTap: () {
                    double nextLevel = stats.level + 1;

                    PlayScreen screen = PlayScreen(
                        level: Level(
                      id: nextLevel,
                      duration: Boxes().levelDuration(nextLevel),
                      points: Boxes().levelPoints(nextLevel),
                    ));

                    _loadScreen(screen);
                  },
                  child: Text(
                    'Next',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.yellowAccent,
                    ),
                  ),
                ),
              ),

              // nextLevel  btn
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
                  // onTap: () => _loadScreen(LaunchScreen()),
                  onTap: () {
                    // double preventLevel = stats.level - 1;
                    double preventLevel = stats.level.toDouble();
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

  _loadScreen(Widget screen) {
    Navigator.of(context).pop();
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }
}

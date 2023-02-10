import 'package:box_coloring_game/game/play_screen.dart';
import 'package:box_coloring_game/model/level.dart';
import 'package:flutter/material.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/ground.png"))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.amber, width: 4),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Text(
                    'Faisal Game',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 60,
                      color: Colors.white,
                    ),
                  )),
              SizedBox(
                height: 50,
              ),
              // Container(
              //     padding: const EdgeInsets.symmetric(horizontal: 8),
              //     decoration: BoxDecoration(
              //       border: Border.all(color: Colors.amber, width: 4),
              //       borderRadius: BorderRadius.all(Radius.circular(12)),
              //     ),
              //     child: Text(
              //       '4 levels Game',
              //       textAlign: TextAlign.center,
              //       style: TextStyle(
              //         fontSize: 50,
              //         color: Colors.white,
              //       ),
              //     )),
              // SizedBox(
              //   height: 25,
              // ),
              // Container(
              //   padding: const EdgeInsets.symmetric(horizontal: 8),
              //   decoration: BoxDecoration(
              //     border: Border.all(color: Colors.amber, width: 4),
              //     borderRadius: BorderRadius.all(Radius.circular(12)),
              //   ),
              //   child: Text(
              //     'upNextlevel 1  ',
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //       fontSize: 36,
              //       color: Colors.white,
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 25,
              ),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 4),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: InkWell(
                      onTap: () => _gotoPlayescreen(),
                      child: Text(
                        'StartGame',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 36,
                          color: Colors.amber,
                        ),
                      ))),
            ],
          ),
        ),
      ),
    );
  }

  _gotoPlayescreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlayScreen(
          level: Level(
            id: 1,
            name: "one",
            duration: 30,
            points: 25,
          ),
        ),
      ),
    );
  }
}

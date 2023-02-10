import 'package:box_coloring_game/game/lunch_game.dart';
import 'package:flutter/material.dart';

class IntroGame extends StatefulWidget {
  const IntroGame({super.key});

  @override
  State<IntroGame> createState() => _IntroGameState();
}

class _IntroGameState extends State<IntroGame> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  'boxes color',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 70,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.amber.shade500, width: 5),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                padding: const EdgeInsets.only(top: 50, left: 4, right: 4),
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: InkWell(
                  onTap: () => _gotoLaunchScreen(),
                  child: const Text(
                    'LunchGame',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 68,
                      color: Colors.grey,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _gotoLaunchScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LaunchScreen()));
  }
}

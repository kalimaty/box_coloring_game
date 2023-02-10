import 'package:flutter/material.dart';
import 'package:box_coloring_game/model/box.dart';

class Boxes {
  List<Box> _allBoxes() {
    List<Box> boxes = [];
    Box redBox = Box(name: 'Red', color: Color(0XFFff1645));
    boxes.add(redBox);
    Box blueBox = Box(name: 'Blue', color: Color(0XFF1c00ff));
    boxes.add(blueBox);
    Box yellowBox = Box(name: 'Yellow', color: Colors.yellow);
    boxes.add(yellowBox);
    Box brownBox = Box(name: 'Brown', color: Color(0XFF88401b));
    boxes.add(brownBox);
    Box pincBox = Box(name: 'pink', color: Colors.pink);
    boxes.add(pincBox);
    Box purpleBox = Box(name: 'Purple', color: Color(0xFFc900c8));
    boxes.add(purpleBox);
    Box greenBox = Box(name: 'Green', color: Color(0XFF00ce77));
    boxes.add(greenBox);
    Box orangBox = Box(name: 'Orang', color: Color(0XFFd84315));
    boxes.add(orangBox);
    Box blackBox = Box(name: 'Black', color: Colors.black);
    boxes.add(blackBox);
    Box tealtBox = Box(name: 'Teal', color: Colors.teal);

    boxes.add(tealtBox);
    Box greyBox = Box(name: 'Grey', color: Colors.grey);
    boxes.add(greyBox);
    Box amberBox = Box(name: 'Amber', color: Colors.amber);
    boxes.add(amberBox);
    Box cyanBox = Box(name: 'Cyan', color: Colors.cyan);
    boxes.add(cyanBox);
    Box indigoBox = Box(name: 'Indigo', color: Colors.indigo);
    boxes.add(indigoBox);

    return boxes;
  }

  List<Box> getBoxes(num number) {
    List<Box> boxes = [];
    List<Box> all = [];
    all.addAll(_allBoxes());
    for (int i = 0; i < all.length; i++) {
      if (boxes.length < number) {
        Box box = all.elementAt(i);
        boxes.add(box);
      }
    }
    return boxes;
  }

//number of boxes in alevel
  num numberOfBoxes(num level) {
    return level * 5;
  }

//Level Duration
  double levelDuration(num level) {
    return level * 30;
  }

//Level Points
  double levelPoints(double level) {
    return numberOfBoxes(level) * 5;
  }
}

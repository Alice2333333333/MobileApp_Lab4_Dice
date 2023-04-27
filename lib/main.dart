import 'dart:math';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:perfect_volume_control/perfect_volume_control.dart';

void main() {
  return runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void playSound() {
    AudioPlayer().play(AssetSource('audio/dice_effect.mp3'));
    PerfectVolumeControl.setVolume(1.0);
  }

  void setDiceNumber() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/dice_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/images/dice_logo.png',
            ),
            Row(
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/images/dice$leftDiceNumber.png',
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    'assets/images/dice$rightDiceNumber.png',
                  ),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20.0),
                backgroundColor: const Color.fromARGB(235, 187, 65, 20),
              ),
              onPressed: () {
                playSound();
                setDiceNumber();
              },
              child: const Text('Button',
                  style: TextStyle(fontFamily: 'Ysabeau', fontSize: 25)),
            ),
          ],
        ),
      ),
    );
  }
}

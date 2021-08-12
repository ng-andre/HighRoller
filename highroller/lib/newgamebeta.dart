import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:random_string/random_string.dart';
import 'dart:math' show Random;
import 'gamelobbybeta.dart';
import 'Blackjack/banker21.dart';
import 'Blackjack/player21.dart';
import 'Mahjong/mahjongsetup.dart';

class BetaNewGame extends StatefulWidget {
  // const BetaNewGame({ Key? key }) : super(key: key);
  @override
  _BetaNewGameState createState() => _BetaNewGameState();
}

class _BetaNewGameState extends State<BetaNewGame> {
  String dropdownGameMode = 'Chips Only';

  final textcontroller = TextEditingController();

  final textcontroller2 = TextEditingController();

  final db = FirebaseDatabase.instance.reference();

  String generateRoomID() {
    return randomAlphaNumeric(5).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(100.0),
          child: Center(
            child: Column(
              children: [
                Spacer(flex: 2),
                Text("Enter your name:"),
                TextField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9]")),
                  ],
                  controller: textcontroller,
                ),
                Spacer(flex: 2),
                Text("Enter starting amount:"),
                TextField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  keyboardType: TextInputType.number,
                  controller: textcontroller2,
                ),
                Spacer(flex: 2),
                DropdownButton<String>(
                  value: dropdownGameMode,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
                  underline: Container(
                    // padding: EdgeInsets.all(7),
                    height: 2,
                    color: Colors.blue,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownGameMode = newValue!;
                    });
                  },
                  items: <String>[
                    'Chips Only',
                    'Blackjack',
                    'Mahjong',
                    // 'Chips with Common Pool'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Spacer(flex: 2),
                ElevatedButton(
                    onPressed: () {
                      final String roomID = generateRoomID();
                      // print(textcontroller.text);
                      // print(textcontroller2.text);
                      db
                          .child(roomID)
                          .child(textcontroller.text)
                          .set(int.parse(textcontroller2.text));
                      db
                          .child(roomID)
                          .child("initial")
                          .set(int.parse(textcontroller2.text));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => (dropdownGameMode == "Mahjong")
                              ? MahjongNewGame(text: roomID)
                              : Banker21(
                                  text: roomID,
                                ),
                        ),
                      );
                    },
                    child: Text("Done")),
                Spacer(flex: 6),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

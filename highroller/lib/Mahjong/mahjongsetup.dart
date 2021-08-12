import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:highroller/newgamebeta.dart';
import 'package:random_string/random_string.dart';
import 'dart:math' show Random;
import 'package:highroller/gamelobbybeta.dart';
import 'mahjonggame.dart';

class MahjongNewGame extends StatefulWidget {
  final String text;
  MahjongNewGame({required this.text});

  @override
  _MahjongNewGameState createState() => _MahjongNewGameState();
}

class _MahjongNewGameState extends State<MahjongNewGame> {
  String dropdownGameMode = 'Chips Only';

  final textcontroller = TextEditingController();
  final textcontroller2 = TextEditingController();

  final db = FirebaseDatabase.instance.reference();
  double maxtai = 1;

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
                Spacer(),
                Text(
                  "Mahjong Mode Setup",
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.5,
                ),
                Spacer(flex: 2),
                Text("Select Game Mode:"),
                MahjongDropdown(),
                Spacer(flex: 2),
                Text("Tai Limit:"),
                Spacer(),
                Text(
                  (maxtai <= 5) ? maxtai.toStringAsFixed(0) : "No Limit",
                  textScaleFactor: 2,
                ),
                Slider(
                  value: maxtai,
                  min: 1,
                  max: 6,
                  divisions: 5,
                  // label: (maxtai < 5) ? maxtai.toStringAsFixed(0) : "No Limit",
                  onChanged: (value) {
                    setState(() {
                      maxtai = value;
                    });
                  },
                ),
                Spacer(flex: 2),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MahjongLobby(
                            text: widget.text,
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

class MahjongDropdown extends StatefulWidget {
  const MahjongDropdown({Key? key}) : super(key: key);

  @override
  MahjongDropdownState createState() => MahjongDropdownState();
}

class MahjongDropdownState extends State<MahjongDropdown> {
  String dropdownValue = 'Regular';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.blue,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['Regular', '3/6', '1/2', '5/1']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

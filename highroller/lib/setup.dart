import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:random_string/random_string.dart';
import 'dart:math' show Random;
import 'mahjong.dart';

class NewGame extends StatelessWidget {
  // const NewGame({Key? key}) : super(key: key);
  final databaseRef = FirebaseDatabase.instance.reference();
  final Future<FirebaseApp> _future = Firebase.initializeApp();

  final String roomID = randomAlphaNumeric(5);

  void setRoom() {
    //create room with random 5 letter name
    databaseRef.child(roomID).set(roomID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(100.0),
          child: Column(
            children: <Widget>[
              Spacer(flex: 3),
              Text("Select Game Mode:"),
              DropdownMenu(),
              Spacer(),
              Text("Enter Starting Amount:"),
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                keyboardType: TextInputType.number,
                // The validator receives the text that the user has entered.
                validator: (value) {
                  // if (value == null || value < 0) {
                  //   return 'Please enter a Room Key';
                  // }
                  // return 'Please enter a Room Key';
                },
              ),
              Spacer(),
              MahjongDropdown(),
              ElevatedButton(
                  onPressed: () {
                    setRoom();
                    Navigator.pushNamed(context, '/game');
                  },
                  child: Text("Done")),
              Spacer(flex: 4),
            ],
          ),
        ),
      ),
    );
  }
}

class DropdownMenu extends StatefulWidget {
  const DropdownMenu({Key? key}) : super(key: key);

  @override
  _DropdownMenuState createState() => _DropdownMenuState();
}

String dropdownGameMode = 'Chips Only';

class _DropdownMenuState extends State<DropdownMenu> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownGameMode,
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
          dropdownGameMode = newValue!;
        });
      },
      items: <String>[
        'Chips Only',
        'Poker',
        'Mahjong',
        'Chips with Common Pool'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class MahjongSetup extends StatelessWidget {
  const MahjongSetup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(100.0),
          child: Column(
            children: [
              Text(
                "Mahjong Mode",
                textScaleFactor: 2,
              ),
              Spacer(
                flex: 2,
              ),
              Text("Select Mode:"),
              MahjongDropdown(),
              Spacer(),
              Text("Tai Limit"),
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                keyboardType: TextInputType.number,
                // The validator receives the text that the user has entered.
                validator: (value) {
                  // if (value == null || value < 0) {
                  //   return 'Please enter a Room Key';
                  // }
                  // return 'Please enter a Room Key';
                },
              ),
              Spacer(),
              ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/game'),
                  child: Text("Done")),
              Spacer(
                flex: 4,
              )
            ],
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

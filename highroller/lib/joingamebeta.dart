import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:random_string/random_string.dart';
import 'dart:math' show Random;
import 'gamelobbybeta.dart';

class BetaJoinGame extends StatelessWidget {
  // const BetaNewGame({ Key? key }) : super(key: key);

  final textcontroller = TextEditingController();
  final textcontroller2 = TextEditingController();
  final db = FirebaseDatabase.instance.reference();

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
                Text("Enter game code:"),
                TextField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9]")),
                  ],
                  controller: textcontroller2,
                ),
                Spacer(flex: 2),
                ElevatedButton(
                    onPressed: () {
                      //get initial value and set
                      final data = db.child("Users");

                      final int chips = db.child(textcontroller2.text.toUpperCase()).child("initial").once().getValue();
                      db
                          .child(textcontroller2.text.toUpperCase())
                          .child(textcontroller.text)
                          .set(chips);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GameLobby(
                              text: textcontroller2.text.toUpperCase(),
                            ),
                          ));
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

void ValidateRoom(String roomID) {
  db.
}
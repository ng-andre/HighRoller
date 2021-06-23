import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:random_string/random_string.dart';
import 'dart:math' show Random;
import 'gamelobbybeta.dart';

class BetaNewGame extends StatelessWidget {
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
                Text("Enter starting amount:"),
                TextField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  keyboardType: TextInputType.number,
                  controller: textcontroller2,
                ),
                Spacer(flex: 2),
                ElevatedButton(
                    onPressed: () {
                      final String roomID = GenerateRoomID();
                      print(textcontroller.text);
                      print(textcontroller2.text);
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
                          builder: (context) => GameLobby(
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

String GenerateRoomID() {
  return randomAlphaNumeric(5).toUpperCase();
}

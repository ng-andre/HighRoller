import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'newgamebeta.dart';

class GameLobby extends StatefulWidget {
  final String text;
  GameLobby({required this.text});

  @override
  _GameLobbyState createState() => _GameLobbyState();
}

class _GameLobbyState extends State<GameLobby> {
  final db = FirebaseDatabase.instance.reference();

  var chips1 = 0; //from
  var chips2 = 0; //to

  void payment(int change, String from, String to) {
    db.child(widget.text).child(from).set(0);
    db.child(widget.text).child(to).set(0);
  }

  void getChips(String from, String to) {
    db.child(widget.text).child(from).once().then((DataSnapshot snapshot) {
      chips1 = snapshot.value;
    });
    db.child(widget.text).child(to).once().then((DataSnapshot snapshot) {
      chips2 = snapshot.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Game Code: ${widget.text}")),
      body: SafeArea(
        child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(30.0),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(),
                        Text("Player"),
                        Spacer(flex: 2),
                        Text("Chips    "),
                        Spacer(flex: 2),
                        Text("  Action     "),
                        Spacer(),
                      ],
                    ),
                    PlayerWidget(),
                  ],
                )
              ],
            )),
      ),
    );
  }
}

class PlayerWidget extends StatefulWidget {
  // const PlayerWidget();

  @override
  _PlayerWidgetState createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Text("john"),
            Spacer(flex: 2),
            Text("50"),
            Spacer(flex: 2),
            ElevatedButton(onPressed: null, child: Text("Pay")),
            Spacer(),
          ],
        ),
        Player2(),
      ],
    );
  }
}

class Player2 extends StatelessWidget {
  // const Player2({Key? key}) : super(key: key);
  final textcontroller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Text("bob"),
            Spacer(flex: 2),
            Text("150"),
            Spacer(flex: 2),
            ElevatedButton(
                onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('How much to pay?'),
                        content: TextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          keyboardType: TextInputType.number,
                          controller: textcontroller2,
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    ),
                child: Text("Pay")),
            Spacer(),
          ],
        ),
      ],
    );
  }
}

class Popup extends StatefulWidget {
  const Popup({Key? key}) : super(key: key);

  @override
  PopupState createState() => PopupState();
}

class PopupState extends State<Popup> {
  final textcontroller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('How many chips?'),
          content: TextField(
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            keyboardType: TextInputType.number,
            controller: textcontroller2,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Show Dialog'),
    );
  }
}

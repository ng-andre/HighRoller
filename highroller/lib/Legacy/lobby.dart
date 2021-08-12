import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

//<Testing>
//For testing purpose everyone initialises with 100 dollars
// Assume player one as yourself.

//Goal:
//Able to subtract and add values from the button
// Money cannot go below 0 ?

//stateful: To handle the transcation and the data.
//stateless: To hand the framework.

class InGame extends StatefulWidget {
  const InGame({Key? key}) : super(key: key);

  @override
  InGameState createState() => InGameState();
}

class InGameState extends State<InGame> {
  var player;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("In Game")),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            PlayerList(),
            PlayerList(),
            PlayerList(),
          ],
        ),
      ),
    );
  }
}

class PlayerList extends StatefulWidget {
  const PlayerList({Key? key}) : super(key: key);

  @override
  PlayerListState createState() => PlayerListState();
}

class PlayerListState extends State<PlayerList> {
  var playername = "player";
  var playercoins = 200;

  void transaction(player1, player2, int value) {
    setState(() {
      player1.playercoins = player2.playercoins - value;
      player2.playercoins = player2.playercoins + value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Spacer(
              flex: 3,
            ),
            Text(
              playername,
              textAlign: TextAlign.center,
            ),
            Spacer(),
            Text(
              "$playercoins",
              textAlign: TextAlign.center,
            ),
            Spacer(),
            ElevatedButton(onPressed: null, child: Text("Pay")),
            Spacer(
              flex: 3,
            ),
          ]),
        ],
      ),
    );
  }
}

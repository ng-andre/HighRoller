import 'package:flutter/material.dart';

class GameHome extends StatefulWidget {
  const GameHome({Key? key}) : super(key: key);

  @override
  GameHomeState createState() => GameHomeState();
}

class GameHomeState extends State<GameHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Game Code: TEST1")),
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

class PlayerList extends StatelessWidget {
  final String playername = "player";
  final int playercoins = 0;

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
          Row(children: [
            Spacer(),
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
            Spacer(),
          ]),
        ],
      ),
    );
  }
}

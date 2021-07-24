// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:highroller/firebase.dart';
import 'package:highroller/gamelobbybeta.dart';
import 'setup.dart';
import 'game.dart';
import 'mahjong.dart';
import 'newgamebeta.dart';
import 'joingamebeta.dart';
import 'mahjonggame.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(),
      '/new': (context) => BetaNewGame(),
      '/join': (context) => BetaJoinGame(),
      '/joinbeta': (context) => NewGame(),
      '/game': (context) => GameHome(),
      // '/mahjong': (context) => MahjongSetup(),
      '/testing': (context) => MahjongLobby(
          // text: "test",
          ),
    },
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(flex: 3),
              Logo(),
              Spacer(),
              ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/new'),
                  child: Text("New Game")),
              ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/join'),
                  child: Text("Join Game")),
              ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/testing'),
                  child: Text("Testing")),
              Spacer(flex: 4),
            ],
          ),
        ),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Image.asset("assets/images/logo.png"),
      width: MediaQuery.of(context).size.width * 0.60,
      padding: EdgeInsets.all(10.0),
    );
  }
}

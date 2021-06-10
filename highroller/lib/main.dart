import 'package:flutter/material.dart';
import 'setup.dart';
import 'game.dart';

// void main() {
//   runApp(MyApp());
// }

void main() {
  runApp(MaterialApp(
    initialRoute: '/game',
    routes: {
      '/': (context) => HomePage(),
      '/join': (context) => JoinForm(),
      '/new': (context) => NewGame(),
      '/game': (context) => GameHome(),
    },
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Logo(),
          ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/new'),
              child: Text("New Game")),
          ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/join'),
              child: Text("Join Game")),
        ],
      )),
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'newgamebeta.dart';

class GameLobby extends StatelessWidget {
  final String text;
  GameLobby({required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Game Code: ${text}")),
      body: SafeArea(
        child: Center(
          child: Container(
            
          ),
        ),
      ),  
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'newgamebeta.dart';
import 'data.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class GameLobby extends StatefulWidget {
  final String text;
  GameLobby({required this.text});

  @override
  _GameLobbyState createState() => _GameLobbyState();
}

class _GameLobbyState extends State<GameLobby> {
  final db = FirebaseDatabase.instance.reference();
  TextEditingController _messageController = TextEditingController();
  ScrollController _scrollController = ScrollController();

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

  Query getMessageQuery() {
    return db.child(widget.text);
  }

  Widget PlayerList() {
    return Expanded(
      child: FirebaseAnimatedList(
        controller: _scrollController,
        query: db.child(widget.text),
        itemBuilder: (context, snapshot, animation, index) {
          final json = snapshot.value as Map<dynamic, dynamic>;
          final playername = Message.fromJson(json);
          final playerchips = chips.fromJson(json);
          return Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  Text(""),
                  Spacer(flex: 2),
                  Text("    Chips "),
                  Spacer(flex: 2),
                  Text("Action"),
                  Spacer(),
                ],
              )
            ],
          );
        },
      ),
    );
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
                        Text(" Player"),
                        Spacer(flex: 2),
                        Text("    Chips "),
                        Spacer(flex: 2),
                        Text("  Action     "),
                        Spacer(),
                      ],
                    ),

                    PlayerTile(text: "player1", money: 500, visible: false),
                    // PlayerTile(text: "bob", money: 300, visible: true)
                  ],
                )
              ],
            )),
      ),
    );
  }
}

class PlayerTile extends StatefulWidget {
  final String text;
  final int money;
  final bool visible;

  PlayerTile({required this.text, required this.money, required this.visible});

  @override
  _PlayerTileState createState() => _PlayerTileState();
}

class _PlayerTileState extends State<PlayerTile> {
  int _payment = 0;

  void _paymentPopup() async {
    // this will contain the result from Navigator.pop(context, result)
    final newTai = await showDialog<double>(
      context: context,
      builder: (context) => PaymentDialog(chips: _payment),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Text(this.widget.text),
            Spacer(flex: 2),
            Text(this.widget.money.toString()),
            Spacer(flex: 2),
            ElevatedButton(
              onPressed: this.widget.visible ? _paymentPopup : null,
              child: Text("Pay"),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}

class PaymentDialog extends StatefulWidget {
  final int chips;

  const PaymentDialog({required this.chips});

  @override
  _PaymentDialogState createState() => _PaymentDialogState();
}

class _PaymentDialogState extends State<PaymentDialog> {
  int _chips = 1;
  final textcontroller2 = TextEditingController();

  @override
  void initState() {
    super.initState();
    _chips = widget.chips;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Enter Chips'),
      content: TextField(
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        keyboardType: TextInputType.number,
        controller: textcontroller2,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            // Use the second argument of Navigator.pop(...) to pass
            // back a result to the page that opened the dialog
            Navigator.pop(context, _chips);
          },
          child: Text('OK'),
        )
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

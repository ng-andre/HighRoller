import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:highroller/firebase.dart';

class MahjongLobby extends StatefulWidget {
  const MahjongLobby({Key? key}) : super(key: key);

  @override
  MahjongLobbyState createState() => MahjongLobbyState();
}

class MahjongLobbyState extends State<MahjongLobby> {
  final textcontroller = TextEditingController();
  double rating = 20;
  double _tai = 1;

  void _victoryPopup() async {
    // this will contain the result from Navigator.pop(context, result)
    final newTai = await showDialog<double>(
      context: context,
      builder: (context) => TaiDialog(initialTai: _tai),
    );

    // note that the result can also be null, so check it
    // (back button or pressed outside of the dialog)
    if (newTai != null) {
      setState(() {
        _tai = newTai;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("GAME CODE")),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Spacer(),
            Text(
              "Mahjong Mode\n",
              textAlign: TextAlign.center,
              textScaleFactor: 1.5,
            ),
            PlayerMahjong(text: "Player1", money: 3),
            PlayerMahjong(text: "Player2", money: 4),
            PlayerMahjong(text: "Player3", money: 600),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Spacer(),
                      Container(width: 60, child: Text("You")),
                      Spacer(),
                      Container(
                          width: 35,
                          child: Text(
                            "300",
                            textAlign: TextAlign.center,
                          )),
                      Spacer(),
                      ElevatedButton(
                        onPressed: null,
                        child: Text("Pay"),
                      ),
                      Spacer(),
                    ],
                  )
                ],
              ),
            ),
            Spacer(),
            ElevatedButton(
                onPressed: _victoryPopup, child: Text("Declare Victory")),
            Spacer(flex: 4),
          ],
        ),
      ),
    );
  }
}

class PlayerMahjong extends StatelessWidget {
  final String text;
  final int money;
  final textcontroller2 = TextEditingController();

  PlayerMahjong({required this.text, required this.money});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              Container(
                  width: 60,
                  child: Text(
                    this.text,
                  )),
              Spacer(),
              Container(
                  width: 35,
                  child: Text(
                    this.money.toString(),
                    textAlign: TextAlign.center,
                  )),
              Spacer(),
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
                child: Text("Pay"),
              ),
              Spacer(),
            ],
          )
        ],
      ),
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

class TaiDialog extends StatefulWidget {
  final double initialTai;

  const TaiDialog({required this.initialTai});

  @override
  _TaiDialogState createState() => _TaiDialogState();
}

class _TaiDialogState extends State<TaiDialog> {
  double _tai = 1;
  bool selfdraw = false;

  @override
  void initState() {
    super.initState();
    _tai = widget.initialTai;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('How many Tai?'),
      content: Container(
        height: 160,
        child: Column(
          children: [
            Text(
              _tai.toStringAsFixed(0),
              textScaleFactor: 2,
            ),
            Container(
              alignment: Alignment.center,
              height: 60,
              child: Slider(
                value: _tai,
                min: 1,
                max: 5,
                divisions: 4,
                // label: _tai.toStringAsFixed(0),
                onChanged: (value) {
                  setState(() {
                    _tai = value;
                  });
                },
              ),
            ),
            CheckboxListTile(
              title: Text("Self Draw (自摸）"), //    <-- label
              value: selfdraw,
              onChanged: (value) {
                setState(() {
                  selfdraw = !selfdraw;
                });
              },
              // secondary: const Icon(Icons.hourglass_empty),
            ),
          ],
        ),
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
            Navigator.pop(context, _tai);
          },
          child: Text('OK'),
        )
      ],
    );
  }
}

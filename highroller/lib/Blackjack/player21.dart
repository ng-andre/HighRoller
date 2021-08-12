import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class Player21 extends StatefulWidget {
  final String text;
  Player21({required this.text});

  @override
  _Player21State createState() => _Player21State();
}

class _Player21State extends State<Player21> {
  double points = 16;
  double multiplier = 2;

  void _victoryPopup() async {
    // this will contain the result from Navigator.pop(context, result)
    final newTai = await showDialog<double>(
      context: context,
      builder: (context) => MultiplierDialog(initialTai: multiplier),
    );

    // note that the result can also be null, so check it
    // (back button or pressed outside of the dialog)
    if (newTai != null) {
      setState(() {
        multiplier = newTai;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Game Code: ${widget.text}")),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              Text(
                "Blackjack Mode - Banker",
                textScaleFactor: 1.5,
              ),
              Spacer(),
              Text(
                (points < 22) ? points.toStringAsFixed(0) : "BUST",
                textScaleFactor: 2,
              ),
              Slider(
                value: points,
                min: 16,
                max: 22,
                divisions: 7,
                // label: (points < 22) ? points.toStringAsFixed(0) : "BUST",
                onChanged: (value) {
                  setState(() {
                    points = value;
                  });
                },
              ),
              Spacer(flex: 2),
              ElevatedButton(onPressed: null, child: Text("Done")),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.red),
                onPressed: _victoryPopup,
                child: Text("BLACKJACK!"),
              ),
              Spacer(),
              ElevatedButton(onPressed: null, child: Text("Escape")),
              Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}

class MultiplierDialog extends StatefulWidget {
  final double initialTai;

  const MultiplierDialog({required this.initialTai});

  @override
  _MultiplierDialogState createState() => _MultiplierDialogState();
}

class _MultiplierDialogState extends State<MultiplierDialog> {
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
      title: Text('Blackjack Multiplier?'),
      content: Container(
        height: 100,
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
                min: 2,
                max: 7,
                divisions: 6,
                // label: _tai.toStringAsFixed(0),
                onChanged: (value) {
                  setState(() {
                    _tai = value;
                  });
                },
              ),
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

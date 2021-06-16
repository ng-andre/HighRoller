import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class NewGame extends StatelessWidget {
  const NewGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(100.0),
        // mainAxisAlignment: MainAxisAlignment,
        child: Column(
          children: <Widget>[
            Spacer(
              flex: 3,
            ),
            Text("Select Game Mode:"),
            DropdownMenu(),
            Spacer(),
            Text("Enter Starting Amount:"),
            TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              keyboardType: TextInputType.number,
              // The validator receives the text that the user has entered.
              validator: (value) {
                // if (value == null || value < 0) {
                //   return 'Please enter a Room Key';
                // }
                // return 'Please enter a Room Key';
              },
            ),
            Spacer(),
            ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/game'),
                child: Text("Done")),
            Spacer(
              flex: 4,
            ),
          ],
        ),
      ),
    );
  }
}

class JoinForm extends StatefulWidget {
  const JoinForm({Key? key}) : super(key: key);

  @override
  _JoinFormState createState() => _JoinFormState();
}

//extract form to new class
//replace form with new state

class _JoinFormState extends State<JoinForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(100.0),
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(
              flex: 4,
            ),
            Text("Enter game code:"),
            Spacer(),
            TextFormField(
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a Room Key';
                }
                return 'Please enter a Room Key';
              },
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Submit'),
            ),
            Spacer(
              flex: 5,
            ),
          ],
        ),
      ),
    );
  }
}

class DropdownMenu extends StatefulWidget {
  const DropdownMenu({Key? key}) : super(key: key);

  @override
  _DropdownMenuState createState() => _DropdownMenuState();
}

class _DropdownMenuState extends State<DropdownMenu> {
  String dropdownValue = 'Chips Only';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.blue,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>[
        'Chips Only',
        'Poker',
        'Mahjong',
        'Chips with Common Pool'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class DropdownGameType extends StatefulWidget {
  // const DropdownGameType({Key key}) : super(key: key);

  @override
  _DropdownGameTypeState createState() => _DropdownGameTypeState();
}

class _DropdownGameTypeState extends State<DropdownGameType> {
  String dropdownValue = 'Chips Only';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>[
        'Chips Only',
        'Poker',
        'Mahjong',
        'Chips with Common Pool'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

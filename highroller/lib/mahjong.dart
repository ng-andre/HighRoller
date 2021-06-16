import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MahjongSetup extends StatelessWidget {
  const MahjongSetup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(100.0),
        child: Column(
          children: [
            Text(
              "Mahjong Mode",
              textScaleFactor: 2,
            ),
            Spacer(
              flex: 2,
            ),
            Text("Select Mode:"),
            MahjongDropdown(),
            Spacer(),
            Text("Tai Limit"),
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
            )
          ],
        ),
      ),
    );
  }
}

class MahjongDropdown extends StatefulWidget {
  const MahjongDropdown({Key? key}) : super(key: key);

  @override
  MahjongDropdownState createState() => MahjongDropdownState();
}

class MahjongDropdownState extends State<MahjongDropdown> {
  String dropdownValue = 'Regular';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
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
      items: <String>['Regular', '3/6', '1/2', '5/1']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

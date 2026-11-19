// EX 1 – The selectable button (handout page: EX 1). Start code from the handout.

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: Center(
          child: Column(
            spacing: 8,
            children: [
              SelectableButton(),
              SelectableButton(),
              SelectableButton(),
              SelectableButton(),
            ],
          ),
        ),
      ),
    ));

class SelectableButton extends StatefulWidget {
  const SelectableButton({
    super.key,
  });

  @override
  State<SelectableButton> createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {
  bool _isSelected = false;

  String get text => _isSelected ? "Selected" : "Not Selected";
  Color get textColor => _isSelected ? Colors.white : Colors.black;
  Color? get backgroundColor =>
      _isSelected ? Colors.blue[500] : Colors.blue[50];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
          onPressed: () => {
                setState(() {
                  _isSelected = !_isSelected;
                })
              },
          child:  Center(
            child: Text(text, style: TextStyle(color: textColor),),
          )),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerButton extends StatelessWidget {
  final String buttonText;
  final Icon icon;
  final VoidCallback onClick;

  DrawerButton({this.buttonText, this.icon, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        child: SizedBox(
          width: 250,
          height: 50,
          child: RaisedButton(
            onPressed: onClick,
            color: Colors.white,
            textColor: Colors.green,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
                side: BorderSide(color: Colors.green)),
            child: Row(
              children: <Widget>[
                icon,
                SizedBox(
                  width: 30,
                ),
                Text(buttonText),
              ],
            ),
          ),
        ));
  }
}

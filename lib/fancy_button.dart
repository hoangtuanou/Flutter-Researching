import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FancyButton extends StatelessWidget {

  FancyButton({@required this.onPressed});

  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Colors.deepOrange,
      splashColor: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            RotatedBox(
              quarterTurns: 3,
                child: Icon(
                Icons.all_inclusive,
                color: Colors.white,
              )
            ),
            SizedBox(width: 8.0),
            Text(
              "PURCHASE",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        )
      ),
      onPressed: onPressed,
      shape: StadiumBorder(),
    );
  }
}
import 'package:flutter/material.dart';

class ButtonApp extends StatelessWidget {
  Color? buttonColor;
  Color? textColor;
  String? text;
  IconData? icon;
  Function? onPressed;

  ButtonApp({
      this.textColor = Colors.white,
      this.buttonColor = Colors.black,
      this.icon = Icons.arrow_forward_ios,
      this.onPressed,
      @required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => {
          onPressed!()
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            )),
        child: Stack(
          children: [
            Align(
                alignment: Alignment.center,
                child: Container(
                  height: 50.0,
                  alignment: Alignment.center,
                  child: Text(
                    text!,
                    style: TextStyle(
                        color: textColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                )),
            Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 50.0,
                  child: CircleAvatar(
                    radius: 15.0,
                    backgroundColor: Colors.white,
                    child: Icon(
                      icon,
                      color: Colors.black,
                    ),
                  ),
                ))
          ],
        ));
  }
}

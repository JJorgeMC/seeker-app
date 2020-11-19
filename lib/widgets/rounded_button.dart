import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const RoundedButton({
    Key key,
    @required this.text,
    this.press,
    this.color = const Color(0xFF5DD39E),
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 58,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: FlatButton(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          onPressed: press,
          color: color,
          textColor: textColor,
        ),
      ),
    );
  }
}

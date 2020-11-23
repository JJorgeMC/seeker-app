import 'package:flutter/material.dart';

class BoxButton extends StatelessWidget {
  final Function press;
  final IconData iconData;
  final String text;
  const BoxButton({
    Key key,
    @required this.press,
    @required this.iconData,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: GestureDetector(
        onTap: press,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Color(0xFFF2F2F2),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 24,
                color: Color(0xFF513B56).withOpacity(0.6),
              ),
              Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF513B56).withOpacity(0.6),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

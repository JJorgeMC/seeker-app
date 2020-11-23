import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final Function press;
  const SectionHeader({
    Key key,
    @required this.title,
    @required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Color(0xFF5DD39E),
            ),
          ),
          IconButton(
            onPressed: press,
            splashColor: Colors.red,
            icon: Icon(
              Icons.add,
              size: 30,
              color: Color(0xFF5DD39E),
            ),
          ),
        ],
      ),
    );
  }
}

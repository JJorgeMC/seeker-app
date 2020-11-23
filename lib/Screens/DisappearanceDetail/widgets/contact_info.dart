import 'package:flutter/material.dart';

class ContactInfo extends StatelessWidget {
  final String text;
  final IconData iconData;
  const ContactInfo({
    Key key,
    @required this.text,
    @required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Poppins',
            ),
          ),
          Icon(
            iconData,
            size: 24,
          ),
        ],
      ),
    );
  }
}

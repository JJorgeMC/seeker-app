import 'package:flutter/material.dart';

class MapHeader extends StatelessWidget {
  final String title;
  final Widget child;
  final Function onPop;
  const MapHeader({
    Key key,
    @required this.title,
    @required this.child,
    this.onPop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      alignment: Alignment.topLeft,
      height: 70,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Colors.white10,
          ],
          stops: [0.8, 1],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: onPop ??
                    () {
                      Navigator.of(context).pop();
                    },
                child: Icon(
                  Icons.navigate_before,
                  size: 35,
                  color: Color(0xFF5DD39E),
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  color: Color(0xFF5DD39E),
                  fontFamily: 'Poppins',
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          child,
        ],
      ),
    );
  }
}

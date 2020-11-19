import 'package:flutter/material.dart';

import 'package:seeker_app/models/disappearance.dart';

class DisappearanceHeader extends StatelessWidget {
  final String name;
  final int age;
  final Status status;
  final Sex sex;
  const DisappearanceHeader({
    Key key,
    @required this.name,
    @required this.age,
    @required this.status,
    @required this.sex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statuses = {
      Status.Found: 'ENCONTRADO',
      Status.Missing: 'DESAPARECIDO',
    };
    final sexColors = {
      Sex.Male: Color(0xFF525174),
      Sex.Female: Color(0xFFF74B7D),
    };
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 30, bottom: 10, top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.navigate_before,
                  color: Color(0xFF5DD39E),
                  size: 35,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: sexColors[sex],
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    statuses[status],
                    style: TextStyle(
                      color: Color(0xFF513B56).withOpacity(0.6),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.person,
                color: Color(0xFF34AAF6),
                size: 30,
              ),
              Text(
                '$age años',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

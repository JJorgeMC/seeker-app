import 'package:flutter/material.dart';

class UserDisappearancesHeader extends StatelessWidget {
  final String firstname;
  final String lastname;
  const UserDisappearancesHeader({
    Key key,
    @required this.firstname,
    @required this.lastname,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 15,
        top: 5,
        bottom: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${firstname.split(' ')[0]} ${lastname.split(' ')[0]}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
          PopupMenuButton(
            onSelected: (value) {
              print(value);
            },
            icon: Icon(
              Icons.more_vert,
              size: 35,
              color: Colors.white,
            ),
            itemBuilder: (ctx) {
              return [
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(Icons.exit_to_app),
                      SizedBox(width: 8),
                      Text('Cerrar sesión'),
                    ],
                  ),
                  value: 'logout',
                ),
              ];
            },
          ),
        ],
      ),
    );
  }
}

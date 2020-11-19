import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:seeker_app/Screens/DisappearanceDetail/disappearance_detail_screen.dart';

import 'package:seeker_app/models/disappearance.dart';

class DisappearanceItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final Status status;
  final DateTime date;
  const DisappearanceItem({
    Key key,
    @required this.imageUrl,
    @required this.name,
    @required this.status,
    @required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statuses = {
      Status.Found: 'ENCONTRADO',
      Status.Missing: 'DESAPARECIDO',
    };
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      splashColor: Color(0xFF525174),
      onTap: () {
        Navigator.of(context).pushNamed(DisappearanceDetailScreen.routeName);
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            ClipRRect(
              child: FadeInImage(
                placeholder:
                    AssetImage('assets/images/user-icon-placeholder.png'),
                image: NetworkImage(imageUrl),
                fit: BoxFit.contain,
                height: 100,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 5,
              ),
              child: Column(
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Text(
                    statuses[status],
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: Color(0xFF525174),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Desde:',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black.withOpacity(0.6),
                          )),
                      Text(
                        DateFormat('dd/MM/yyyy').format(date),
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

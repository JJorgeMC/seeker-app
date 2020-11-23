import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:seeker_app/Screens/DisappearanceDetail/disappearance_detail_screen.dart';
import 'package:seeker_app/Screens/Tabs/UserDisappearances/widgets/menu_button.dart';
import 'package:seeker_app/Screens/Tabs/UserDisappearances/widgets/row_data.dart';
import 'package:seeker_app/models/disappearance.dart';

class DisappearanceReview extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int age;
  final DateTime disappearanceDate;
  final Status status;
  final String lastLocationAddress;
  final String phoneNumber;
  final String email;

  const DisappearanceReview({
    Key key,
    @required this.imageUrl,
    @required this.name,
    @required this.age,
    @required this.disappearanceDate,
    @required this.status,
    @required this.lastLocationAddress,
    @required this.phoneNumber,
    @required this.email,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final statuses = {
      Status.Found: 'ENCONTRADO',
      Status.Missing: 'DESAPARECIDO',
    };
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(DisappearanceDetailScreen.routeName);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 5,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                  child: FadeInImage(
                    placeholder: AssetImage(
                      'assets/images/placeholder-image.png',
                    ),
                    image: NetworkImage(
                        'https://via.placeholder.com/240' ?? imageUrl),
                    fit: BoxFit.cover,
                    height: 240,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: MenuButton(
                    onSelected: (index) {},
                    options: [
                      'Marcar como enconctrado',
                      'Modificar',
                      'Eliminar'
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Carlos Ezeta',
                      style: TextStyle(
                        color: Color(0xFF525174),
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text: ' $age años',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  RowData(
                    text: 'Fecha de desaparición: ',
                    value: DateFormat('dd/MM/yyyy').format(disappearanceDate),
                  ),
                  RowData(
                    text: 'Estado: ',
                    value: statuses[status],
                  ),
                  RowData(
                    text: 'Última ubicación: ',
                    value: lastLocationAddress,
                  ),
                  Text(
                    'Contactos',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  RowData(
                    text: 'Teléfono: ',
                    value: phoneNumber,
                  ),
                  RowData(
                    text: 'Correo: ',
                    value: email,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

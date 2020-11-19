import 'package:flutter/material.dart';
import 'package:seeker_app/Screens/DisappearanceDetail/widgets/disappearance_header.dart';
import 'package:seeker_app/models/disappearance.dart';
import 'package:seeker_app/widgets/rounded_button.dart';

class DisappearanceDetailScreen extends StatelessWidget {
  static const routeName = '/disappearance-detail';

  const DisappearanceDetailScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            DisappearanceHeader(
              name: 'Carlos Ezeta',
              status: Status.Missing,
              age: 20,
              sex: Sex.Male,
            ),
            Container(
              height: 220,
              width: double.infinity,
              color: Color(0xFF513B56).withOpacity(0.1),
              child: Image.asset(
                'assets/images/placeholder-image.png',
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Fecha de desaparición:'),
                      Text('Lunes 8 de noviembre del 2020'),
                    ],
                  ),
                  SizedBox(height: 5),
                  RichText(
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      style: TextStyle(fontSize: 14, color: Colors.black),
                      children: [
                        TextSpan(
                            text:
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ac accumsan, at ipsum, aliquam amet. Aliquam sed orci, cras auctor aliquam quis. Egestas tincidunt augue convallis sed magna id praesent condimentum. Natoque mauris eget tellus'),
                        TextSpan(
                          text: 'ver más',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Lugar de desaparición',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Text(
                    'Av. Oscar R. Benavides Cercado de Lima 12315',
                    style: TextStyle(
                        fontSize: 14, color: Colors.black.withOpacity(0.5)),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    color: Color(0xFF513B56).withOpacity(0.1),
                    height: 144,
                    width: double.infinity,
                    child: Image.asset('assets/images/placeholder-image.png'),
                  ),
                  RoundedButton(
                    text: 'CONTACTOS',
                    press: () {},
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

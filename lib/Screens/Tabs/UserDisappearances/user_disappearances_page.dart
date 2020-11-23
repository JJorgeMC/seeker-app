import 'package:flutter/material.dart';
import 'package:seeker_app/Screens/Auth/widgets/background.dart';
import 'package:seeker_app/Screens/EditDisappearance/edit_disappearance_screen.dart';
import 'package:seeker_app/Screens/Tabs/UserDisappearances/widgets/disappearance_review.dart';
import 'package:seeker_app/Screens/Tabs/UserDisappearances/widgets/section_header.dart';
import 'package:seeker_app/Screens/Tabs/UserDisappearances/widgets/user_disappearance_header.dart';
import 'package:seeker_app/models/disappearance.dart';

class UserDisappearancesPage extends StatelessWidget {
  const UserDisappearancesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            UserDisappearancesHeader(
              firstname: 'Jorge Daniel',
              lastname: 'Maquera Canales',
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFAFAFA),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(15),
                  ),
                ),
                child: Column(
                  children: [
                    SectionHeader(
                      title: 'Publicaciones',
                      press: () {
                        Navigator.of(context)
                            .pushNamed(EditDisappearanceScreen.routeName);
                      },
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          DisappearanceReview(
                            imageUrl: '',
                            name: 'Carlos Ezeta',
                            age: 20,
                            disappearanceDate: DateTime.now(),
                            status: Status.Missing,
                            lastLocationAddress:
                                'Av. Oscar R. Benavides Cercado de Lima',
                            phoneNumber: '993504601',
                            email: 'porcarlos@gmail.com',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

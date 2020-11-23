import 'package:flutter/material.dart';
import 'package:seeker_app/Screens/DisappearanceDetail/widgets/contact_info.dart';
import 'package:seeker_app/models/disappearance.dart';
import 'package:seeker_app/widgets/rounded_button.dart';

class ContactModal extends StatelessWidget {
  final String firstname;
  final String lastname;
  final String email;
  final String phoneNumber;
  final Relation relation;
  const ContactModal({
    Key key,
    @required this.firstname,
    @required this.lastname,
    @required this.email,
    @required this.phoneNumber,
    @required this.relation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final relations = {
      Relation.Friend: 'amigo',
      Relation.Relative: 'familiar',
    };
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Color(0xFFFAFAFA),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Contactos',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Poppins',
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
              RichText(
                text: TextSpan(
                  text: '${firstname.split(' ')[0]} ${lastname.split(' ')[0]}',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ' (${relations[relation]})',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black45,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              ContactInfo(
                text: phoneNumber,
                iconData: Icons.phone,
              ),
              ContactInfo(
                text: email,
                iconData: Icons.mail_outline,
              )
            ],
          ),
          RoundedButton(
            text: 'LISTO',
            color: Theme.of(context).accentColor,
            press: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}

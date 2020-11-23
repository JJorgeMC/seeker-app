import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:seeker_app/Screens/DisappearanceDetail/disappearance_detail_screen.dart';
import 'package:seeker_app/Screens/EditDisappearance/widgets/form_header.dart';
import 'package:seeker_app/Screens/EditDisappearance/widgets/form_section.dart';
import 'package:seeker_app/Screens/EditDisappearance/widgets/image_input.dart';
import 'package:seeker_app/Screens/EditDisappearance/widgets/location_input.dart';
import 'package:seeker_app/Screens/EditDisappearance/widgets/radio_button_group.dart';
import 'package:seeker_app/models/disappearance.dart';
import 'package:seeker_app/widgets/rounded_button.dart';
import 'package:seeker_app/widgets/text_field_container.dart';

class EditDisappearanceScreen extends StatefulWidget {
  static const routeName = '/edit-disappearance';

  const EditDisappearanceScreen({Key key}) : super(key: key);

  @override
  _EditDisappearanceScreenState createState() =>
      _EditDisappearanceScreenState();
}

class _EditDisappearanceScreenState extends State<EditDisappearanceScreen> {
  Relation relation;
  Sex sex;
  DateTime disappearanceDate;
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> formPages = [
      buildFormFirstPage(),
      buildFormSecondPage(),
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                children: [
                  FormHeader(title: 'Registrar desaparición'),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: [
                              buildFormFirstPage(),
                              buildFormSecondPage(),
                            ][currentPageIndex],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 10,
              ),
              child: Column(
                children: [
                  if (currentPageIndex == 0)
                    RoundedButton(
                      text: 'SIGUIENTE',
                      press: () {
                        setState(() {
                          currentPageIndex++;
                        });
                      },
                    ),
                  if (currentPageIndex == 1)
                    RoundedButton(
                      text: 'PUBLICAR',
                      press: () {
                        Navigator.of(context).pushReplacementNamed(
                            DisappearanceDetailScreen.routeName);
                      },
                    ),
                  if (currentPageIndex > 0) SizedBox(height: 10),
                  if (currentPageIndex == 1)
                    RoundedButton(
                      text: 'ATRAS',
                      color: Theme.of(context).accentColor,
                      press: () {
                        setState(() {
                          currentPageIndex--;
                        });
                      },
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildFormSecondPage() {
    return Column(
      children: [
        FormSection(
          title: 'Información de la publicación',
          children: [
            SizedBox(height: 10),
            TextFieldContainer(
              child: TextFormField(
                maxLines: 4,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Descripción de la publicación',
                ),
              ),
            ),
            SizedBox(height: 10),
            ImageInput(
              onSelectImage: (List<File> images) {
                setState(() {});
              },
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        FormSection(
          title: 'Datos de contacto',
          children: [
            SizedBox(height: 10),
            TextFieldContainer(
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Teléfono',
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFieldContainer(
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Correo',
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget buildFormFirstPage() {
    return FormSection(
      title: 'Datos del desaparecido',
      children: [
        SizedBox(height: 10),
        TextFieldContainer(
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Nombres y apellidos',
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(height: 10),
        TextFieldContainer(
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Edad',
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(height: 5),
        RadioButtonGroup(
          groupTitle: 'Relación',
          enums: Relation.values,
          value: relation,
          press: (value) {
            print(value);
            setState(() {
              relation = value;
            });
          },
        ),
        RadioButtonGroup(
          groupTitle: 'Sexo',
          enums: Sex.values,
          value: sex,
          press: (value) {
            setState(() {
              sex = value;
            });
          },
        ),
        Text(
          'Fecha de desaparición',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Color(0xFF513B56).withOpacity(0.6),
          ),
        ),
        SizedBox(height: 5),
        TextFieldContainer(
          child: TextFormField(
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2020),
                lastDate: DateTime.now(),
                builder: (context, child) {
                  return Theme(
                    data: ThemeData.light().copyWith(
                      colorScheme:
                          ColorScheme.light(primary: const Color(0xFF5DD39E)),
                    ),
                    child: child,
                  );
                },
              );
              print(date);
              setState(() {
                disappearanceDate = date;
              });
            },
            textAlignVertical: TextAlignVertical.center,
            readOnly: true,
            decoration: InputDecoration(
              hintText: disappearanceDate != null
                  ? DateFormat('dd/MM/yyyy').format(disappearanceDate)
                  : 'dd/MM/yyyy',
              border: InputBorder.none,
              suffixIcon: Icon(Icons.calendar_today),
            ),
          ),
        ),
        SizedBox(height: 10),
        LocationInput(onSelectPlace: (double lat, double lng) {}),
      ],
    );
  }
}

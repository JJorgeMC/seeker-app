import 'package:flutter/material.dart';
import 'package:seeker_app/models/disappearance.dart';

class RadioButtonGroup extends StatelessWidget {
  final String groupTitle;
  final List<dynamic> enums;
  final dynamic value;
  final Function press;
  const RadioButtonGroup({
    Key key,
    @required this.groupTitle,
    @required this.enums,
    @required this.value,
    @required this.press,
  }) : super(key: key);

  Map<dynamic, String> labelEnum(Type type) {
    switch (type) {
      case Relation:
        return {
          Relation.Friend: 'Amigo',
          Relation.Relative: 'Familiar',
        };
      case Sex:
        return {
          Sex.Female: 'Femenino',
          Sex.Male: 'Masculino',
        };
        break;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final labels = labelEnum(enums[0].runtimeType);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          groupTitle,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Color(0xFF513B56).withOpacity(0.6),
          ),
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: enums
              .map(
                (e) => Row(
                  children: [
                    Radio(
                      activeColor: Color(0xFF5DD39E),
                      value: e,
                      groupValue: value,
                      onChanged: press,
                    ),
                    Text(labels[e]),
                  ],
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

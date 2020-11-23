import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final List<String> options;
  final void Function(int selectedOptionIndex) onSelected;
  const MenuButton({
    Key key,
    @required this.options,
    @required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.white12,
        child: PopupMenuButton(
          icon: Icon(
            Icons.more_vert,
            size: 30,
            color: Theme.of(context).accentColor,
          ),
          onSelected: onSelected,
          itemBuilder: (ctx) {
            return options
                .asMap()
                .map(
                  (int index, String text) {
                    return MapEntry(
                      index,
                      PopupMenuItem(
                        child: Text(
                          text,
                        ),
                        value: index,
                      ),
                    );
                  },
                )
                .values
                .toList();
          },
        ),
      ),
    );
  }
}

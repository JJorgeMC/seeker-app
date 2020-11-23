import 'package:flutter/material.dart';

class RowData extends StatelessWidget {
  final String text;
  final String value;
  const RowData({
    Key key,
    @required this.text,
    @required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).accentColor.withOpacity(0.6),
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}

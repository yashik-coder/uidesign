import 'package:flutter/material.dart';
import 'package:uidesign/utils/constants.dart';
import 'package:uidesign/utils/widgets_function.dart';

class optionButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final double width;

  const optionButton(
      {super.key, required this.text, required this.icon, required this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: FlatButton(
        color: COLOR_DARK_BLUE,
        splashColor: COLOR_WHITE.withAlpha(55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        onPressed: () {},
        child: Row(children: [
          Icon(
            icon,
            color: COLOR_WHITE,
          ),
          addhorizontalspace(10),
          Text(
            text,
            style: TextStyle(color: COLOR_WHITE),
          ),
        ]),
      ),
    );
  }
}

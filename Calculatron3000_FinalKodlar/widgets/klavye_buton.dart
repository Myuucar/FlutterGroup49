import 'package:flutter/material.dart';
import 'package:akademi_mezun/stil/renk_stili.dart';

class KeyboardButton extends StatelessWidget {
  const KeyboardButton({
    Key? key,
    required this.value,
    this.callback,
    this.color,
  }) : super(key: key);

  final String value;
  final Function(String)? callback;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (callback != null) callback!(value);
      },
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: RenkStili.buttonBackgroundColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              value,
              style: TextStyle(
                color: color ?? RenkStili.textPrimaryColor,
                fontSize: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
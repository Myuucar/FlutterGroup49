import 'package:flutter/material.dart';
import 'package:akademi_mezun/stil/renk_stili.dart';
import 'package:akademi_mezun/widgets/klavye_buton.dart';

class KeyboardLayout extends StatelessWidget {
  const KeyboardLayout({Key? key, this.numberCallback, this.acctionCallback})
      : super(key: key);

  final Function(String)? numberCallback;
  final Function(String)? acctionCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: RenkStili.secondaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                KeyboardButton(
                  value: 'AC',
                  color: RenkStili.textColdColor,
                  callback: _tapOnAction,
                ),
                KeyboardButton(
                  value: 'CE',
                  color: RenkStili.textColdColor,
                  callback: _tapOnAction,
                ),
                KeyboardButton(
                  value: '%',
                  color: RenkStili.textColdColor,
                  callback: _tapOnAction,
                ),
                KeyboardButton(
                  value: '/',
                  color: RenkStili.textHotColor,
                  callback: _tapOnNumber,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                KeyboardButton(
                  value: '7',
                  callback: _tapOnNumber,
                ),
                KeyboardButton(
                  value: '8',
                  callback: _tapOnNumber,
                ),
                KeyboardButton(
                  value: '9',
                  callback: _tapOnNumber,
                ),
                KeyboardButton(
                  value: 'x',
                  color: RenkStili.textHotColor,
                  callback: _tapOnNumber,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                KeyboardButton(
                  value: '4',
                  callback: _tapOnNumber,
                ),
                KeyboardButton(
                  value: '5',
                  callback: _tapOnNumber,
                ),
                KeyboardButton(
                  value: '6',
                  callback: _tapOnNumber,
                ),
                KeyboardButton(
                  value: '-',
                  color: RenkStili.textHotColor,
                  callback: _tapOnNumber,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                KeyboardButton(
                  value: '1',
                  callback: _tapOnNumber,
                ),
                KeyboardButton(
                  value: '2',
                  callback: _tapOnNumber,
                ),
                KeyboardButton(
                  value: '3',
                  callback: _tapOnNumber,
                ),
                KeyboardButton(
                  value: '+',
                  color: RenkStili.textHotColor,
                  callback: _tapOnNumber,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                KeyboardButton(
                  value: '00',
                  callback: _tapOnNumber,
                ),
                KeyboardButton(
                  value: '0',
                  callback: _tapOnNumber,
                ),
                KeyboardButton(
                  value: '.',
                  callback: _tapOnNumber,
                ),
                KeyboardButton(
                  value: '=',
                  color: RenkStili.textHotColor,
                  callback: _tapOnAction,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _tapOnNumber(String number) {
    if (numberCallback != null) numberCallback!(number.toLowerCase());
  }

  void _tapOnAction(String action) {
    if (acctionCallback != null) acctionCallback!(action.toLowerCase());
  }
}
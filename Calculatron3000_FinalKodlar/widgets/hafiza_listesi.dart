import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:akademi_mezun/class/ifade_operatorleri.dart';
import 'package:akademi_mezun/stil/renk_stili.dart';

class MemoryList extends StatelessWidget {
  const MemoryList({
    Key? key,
    required this.memory,
    required this.callback,
    required this.currentExpression,
  }) : super(key: key);

  final List<String> memory;
  final Function(String) callback;
  final String currentExpression;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: RenkStili.secondaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: memory.isNotEmpty ? _getList() : _getEmptyMessage(),
      ),
    );
  }

  Widget _getEmptyMessage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.hourglass_disabled_rounded,
          color: RenkStili.textPrimaryColor,
          size: 46,
        ),
        const SizedBox(height: 20),
        Text(
          'İşlem bulunmamaktadır!',
          style: TextStyle(
            color: RenkStili.textPrimaryColor,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _getList() {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (String expression in memory) _getListItem(expression),
        ],
      ),
    );
  }

  Widget _getListItem(String expression) {
    IfadeOperatorleri expressionProcessing = IfadeOperatorleri();
    NumberFormat numberFormat = NumberFormat.decimalPattern('en_us');

    return GestureDetector(
      onTap: () {
        callback(expression);
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: currentExpression == expression
              ? Colors.blueAccent.withOpacity(0.2)
              : Colors.white.withOpacity(0.02),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: double.infinity),
            Text(
              expression,
              style: TextStyle(
                color: RenkStili.textPrimaryColor,
                fontWeight: FontWeight.w300,
                fontSize: 16,
              ),
            ),
            Divider(
              color: Colors.white.withOpacity(0.1),
              height: 20,
            ),
            Text(
              numberFormat.format(expressionProcessing.process(expression)),
              style: TextStyle(
                color: RenkStili.textPrimaryColor,
                fontWeight: FontWeight.w300,
                fontSize: 46,
              ),
            ),
            StarButton(
              isStarred: false,
              iconDisabledColor: Colors.white,
              valueChanged: (_isStarred) {
                print('Is Starred : $_isStarred');
              },
            )
          ],
        ),
      ),
    );
  }
}
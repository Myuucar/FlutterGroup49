import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:akademi_mezun/class/ifade_operatorleri.dart';
import 'package:akademi_mezun/stil/renk_stili.dart';
import 'package:akademi_mezun/widgets/klavye.dart';
import 'package:akademi_mezun/widgets/hafiza_listesi.dart';

void main() {
  runApp(const Application());
}

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  // variables
  String largeResultText = '';
  String smallResultText = '';
  bool showMemoryPage = false;
  List<String> memory = [];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: RenkStili.primaryColor,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: RenkStili.secondaryColor,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: RenkStili.primaryColor,
        body: SafeArea(
          child: _getMainBody(),
        ),
      ),
    );
  }

  Widget _getMainBody() {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showMemoryPage = !showMemoryPage;
                    });
                  },
                  child: Icon(
                    showMemoryPage ? Icons.close : Icons.menu,
                    color: Colors.white,
                    size: 26,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 27,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(width: double.infinity),
                _getColoredResult(
                  inputs: _getResultParted(smallResultText),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: SingleChildScrollView(
                    child: _getColoredResult(
                      inputs: _getResultParted(largeResultText),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 54,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 70,
          child: showMemoryPage
              ? MemoryList(
            memory: memory,
            currentExpression: smallResultText,
            callback: _memoryCallback,
          )
              : KeyboardLayout(
            numberCallback: numberButtonsCallback,
            acctionCallback: actionButtonsCallback,
          ),
        ),
      ],
    );
  }

  void numberButtonsCallback(String number) {
    setState(() {
      if (largeResultText.isEmpty &&
          (number == '/' || number == 'x' || number == '-' || number == '+')) {
        largeResultText = '';
      } else {
        largeResultText = '$largeResultText$number';
      }
    });
  }

  void actionButtonsCallback(String action) {
    setState(() {
      switch (action) {
        case 'ac':
          largeResultText = '';
          smallResultText = '';
          break;
        case 'ce':
          if (largeResultText.isNotEmpty) {
            largeResultText =
                largeResultText.substring(0, largeResultText.length - 1);
          }
          break;
        case '=':
          String trimed = _trim(largeResultText);
          smallResultText = trimed;
          memory.add(trimed);
          IfadeOperatorleri expressionProcessing = IfadeOperatorleri();
          largeResultText = expressionProcessing.process(trimed).toString();
          break;
        case '%':
          largeResultText += '%';
          break;
      }
    });
  }


  void _memoryCallback(String expression) {
    IfadeOperatorleri expressionProcessing = IfadeOperatorleri();
    setState(() {
      smallResultText = expression;
      largeResultText =
          expressionProcessing.process(expression).toStringAsFixed(0);
    });
  }

  Widget _getColoredResult({required List<String> inputs, TextStyle? style}) {
    return RichText(
      textAlign: TextAlign.right,
      text: TextSpan(
        style: style,
        children: <TextSpan>[
          for (String part in inputs)
            TextSpan(
              text: _isOperator(part) ? ' $part ' : part,
              style: TextStyle(
                color: _isOperator(part)
                    ? RenkStili.textHotColor
                    : Colors.white,
              ),
            ),
        ],
      ),
    );
  }

  List<String> _getResultParted(String inputPhrase) {

    List<String> returnPhrase = [];
    String temp = '';

    for (int c = 0; c < inputPhrase.length; c++) {
      if (_isOperator(inputPhrase[c])) {
        returnPhrase.add(temp);
        returnPhrase.add(inputPhrase[c]);
        temp = '';
      } else {
        temp += inputPhrase[c];
      }

      if (c == inputPhrase.length - 1 && temp.isNotEmpty) {
        returnPhrase.add(temp);
      }
    }

    return returnPhrase;
  }

  bool _isOperator(String text) {
    return (text == '/' ||
        text == 'x' ||

        text == '-' ||
        text == '+' ||
        text == '%');
  }

  String _trim(String text) {
    String temp = text;

    while (_isOperator(text[0])) {
      temp = temp.substring(1, temp.length);
    }

    while (_isOperator(text[temp.length - 1])) {
      temp = temp.substring(0, temp.length - 1);
    }

    return temp;
  }
}
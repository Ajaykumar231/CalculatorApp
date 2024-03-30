import 'package:cal/common/buttons/buttons.dart';
import 'package:cal/common/colors/colors.dart';
import 'package:cal/common/extensions/custom_theme_extension.dart';
import 'package:cal/common/theme/dark_theme.dart';
import 'package:cal/common/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ' Calculator',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var userQuestion = '';
  var userAnswer = '';
  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(
                      userQuestion,
                      style: const TextStyle(
                          //color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 30),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(
                      userAnswer,
                      style: const TextStyle(
                          //color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 45),
                    ),
                  )
                ],
              ),
            )),
            Expanded(
                flex: 2,
                child: Container(
                  child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return MyButton(
                          buttonTapped: () {
                            setState(() {
                              userQuestion = '';
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.grey[800],
                          textColor: Colors.white,
                        );
                      } else if (index == buttons.length - 1) {
                        return MyButton(
                          buttonTapped: () {
                            setState(() {
                              equalpressed();
                            });
                          },
                          buttonText: buttons[index],
                          color: maincolor,
                          textColor: Colors.white,
                        );
                      } else {
                        return MyButton(
                          buttonTapped: () {
                            setState(() {
                              userQuestion += buttons[index];
                            });
                          },
                          buttonText: buttons[index],
                          color: isOperator(buttons[index])
                              ? maincolor
                              : context.theme.buttoncolor,
                              
                          textColor: isOperator(buttons[index])
                              ? Colors.white
                              : Colors.white,
                        );
                      }
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  void equalpressed() {
    String finalquestion = userQuestion;
    finalquestion = finalquestion.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finalquestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = eval.toString();
  }
}

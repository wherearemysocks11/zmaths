import 'package:flutter/material.dart';
import 'main.dart';
import 'dart:math';
import 'dart:async';

List<bool> correctButton = [];

class ActivityScreen extends StatefulWidget {
  ActivityScreen({super.key, required this.difficulty});
  late String difficulty;
  String quesSel = '';
  List<String> randInt = [];
  String butA = '';
  String butB = '';
  String butC = '';
  String butD = '';
  String qNum1 = '';
  String qNum2 = '';
  /* default button colour */
  List<int> colour = [255, 33, 134, 217];

  @override
  State<StatefulWidget> createState() {
    return ActivityScreenState(
        difficulty: this.difficulty,
        randInt: randInt,
        quesSel: quesSel,
        butA: this.butA,
        butB: this.butB,
        butC: this.butC,
        butD: this.butD,
        qNum1: this.qNum1,
        qNum2: this.qNum2,
        colour: colour);
  }
}

class ActivityScreenState extends State<ActivityScreen> {
  final String difficulty;
  late List<String> randInt;
  late String quesSel;
  late String butA = '';
  late String butB = '';
  late String butC = '';
  late String butD = '';
  late String qNum1 = '';
  late String qNum2 = '';
  /* default button colour */
  late List<int> colour = [255, 33, 134, 217];

  ActivityScreenState(
      {required this.difficulty,
      required this.randInt,
      required this.quesSel,
      required String butA,
      required String butB,
      required String butC,
      required String butD,
      required String qNum1,
      required String qNum2,
      required List<int> colour});

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        /* this grabs 15 questions starting at different locations in the
        database, i.e. 1, 16, 31 based on the difficulty */
        if (difficulty == 'Easy') {
          quesSel = ranIntGen(1, 15).toString();
        } else if (difficulty == 'Medium') {
          quesSel = ranIntGen(16, 15).toString();
        } else if (difficulty == 'Hard') {
          quesSel = ranIntGen(31, 15).toString();
        }

        /* generates random wrong answers, the selected question is passed into
        it in order to ensure none of them match the correct answer */
        List<String> randInt = uniqRanIntsGen(quesSel);

        // creates a list to decide what button will have the correct answer
        List<bool> correctButton = getCorrectBut();

        /* generates a value for the button based on: is the correct button,
        what the question it is, so it can print the correct correct answer,
        what button it is (this is part of the process to ensure the wrong
        answers are all unique, finally the randInt is the unique wrong
        answers) */
        butA = ansFetch(correctButton[0], quesSel, 0, randInt);
        butB = ansFetch(correctButton[1], quesSel, 1, randInt);
        butC = ansFetch(correctButton[2], quesSel, 2, randInt);
        butD = ansFetch(correctButton[3], quesSel, 3, randInt);

        /* fetches the two numbers needed to ask the question based on the
        selected question and which side of the equation the widget is */
        qNum1 = queFetch(quesSel, 'a');
        qNum2 = queFetch(quesSel, 'b');

        /* default button colour */
        colour = [255, 33, 134, 217];
      });
    });
  }

  void buttonHandler(isAnsButton) {
    /* this section sets the buttons to red or green based on 
    whether the button selected is the wrong and correct answer respectively*/
    if (isAnsButton) {
      setState(() {
        colour = [255, 0, 248, 41];
      });
    } else {
      setState(() {
        colour = [255, 248, 0, 0];
      });
    }
    // delay implemented so that the user can see the red/green
    Timer(const Duration(milliseconds: 550), () {
      setState(() {
        // colour is set back to the default blue colour
        colour = [255, 33, 134, 217];

        /* this grabs 15 questions starting at different locations in the
        database, i.e. 1, 16, 31 based on the difficulty */
        if (difficulty == 'Easy') {
          quesSel = ranIntGen(1, 15).toString();
        } else if (difficulty == 'Medium') {
          quesSel = ranIntGen(16, 15).toString();
        } else if (difficulty == 'Hard') {
          quesSel = ranIntGen(31, 15).toString();
        }

        /* generates random wrong answers, the selected question is passed into
        it in order to ensure none of them match the correct answer */
        List<String> randInt = uniqRanIntsGen(quesSel);

        // creates a list to decide what button will have the correct answer
        List<bool> correctButton = getCorrectBut();

        /* generates a value for the button based on: is the correct button,
        what the question it is, so it can print the correct correct answer,
        what button it is (this is part of the process to ensure the wrong
        answers are all unique, finally the randInt is the unique wrong
        answers) */
        butA = ansFetch(correctButton[0], quesSel, 0, randInt);
        butB = ansFetch(correctButton[1], quesSel, 1, randInt);
        butC = ansFetch(correctButton[2], quesSel, 2, randInt);
        butD = ansFetch(correctButton[3], quesSel, 3, randInt);

        /* fetches the two numbers needed to ask the question based on the
        selected question and which side of the equation it is */
        qNum1 = queFetch(quesSel, 'a');
        qNum2 = queFetch(quesSel, 'b');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // Variables to hold width/height so widgets can adjust spacing based on the page size
    double pageHeight = (MediaQuery.of(context).size.height);
    double pageWidth = (MediaQuery.of(context).size.height);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text(
          'ZMaths',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 245, 176, 176),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // question display
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(qNum1,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 100)),
                ),
                const Expanded(
                  child: Text("+",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w800, fontSize: 100)),
                ),
                Expanded(
                  child: Text(qNum2,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 100)),
                ),
              ],
            ),
            // answer selection bar
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: pageHeight / 75,
                      top: pageHeight / 75,
                      left: pageWidth / 75,
                      right: pageWidth / 75,
                    ),
                    child: Align(
                      alignment: const Alignment(0.0, 0.0),
                      child: MaterialButton(
                        onPressed: () {
                          buttonHandler(correctButton[0]);
                        },
                        color: Color.fromARGB(
                            colour[0], colour[1], colour[2], colour[3]),
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        textColor: const Color.fromARGB(255, 253, 254, 255),
                        height: 60,
                        minWidth: 140,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Text(
                          butA,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: pageHeight / 75,
                      top: pageHeight / 75,
                      left: pageWidth / 75,
                      right: pageWidth / 75,
                    ),
                    child: Align(
                      alignment: const Alignment(0.0, 0.0),
                      child: MaterialButton(
                        onPressed: () {
                          buttonHandler(correctButton[1]);
                        },
                        color: Color.fromARGB(
                            colour[0], colour[1], colour[2], colour[3]),
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        textColor: const Color.fromARGB(255, 253, 254, 255),
                        height: 60,
                        minWidth: 140,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Text(
                          butB,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: pageHeight / 75,
                      top: pageHeight / 75,
                      left: pageWidth / 75,
                      right: pageWidth / 75,
                    ),
                    child: Align(
                      alignment: const Alignment(0.0, 0.0),
                      child: MaterialButton(
                        onPressed: () {
                          buttonHandler(correctButton[2]);
                        },
                        color: Color.fromARGB(
                            colour[0], colour[1], colour[2], colour[3]),
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        textColor: const Color.fromARGB(255, 253, 254, 255),
                        height: 60,
                        minWidth: 140,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Text(
                          butC,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: pageHeight / 75,
                      top: pageHeight / 75,
                      left: pageWidth / 75,
                      right: pageWidth / 75,
                    ),
                    child: Align(
                      alignment: const Alignment(0.0, 0.0),
                      child: MaterialButton(
                        onPressed: () {
                          buttonHandler(correctButton[3]);
                        },
                        color: Color.fromARGB(
                            colour[0], colour[1], colour[2], colour[3]),
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        textColor: const Color.fromARGB(255, 253, 254, 255),
                        height: 60,
                        minWidth: 140,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Text(
                          butD,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

String ansFetch(
    bool isAnsButton, String quesSel, int button, List<String> randInt) {
  if (isAnsButton == true) {
    // grabs answer from the selected question in the database
    return questionsBox.get(quesSel)!.ans;
  } else {
    // returns the unique wrong answer
    return randInt[button].toString();
  }
}

/* this function generates a list of unique random wrong numbers that are
passed onto the buttons which are not the answer button, it ensures it is
unique by comparing them to the correct answer and already generated 
wrong answers */
List<String> uniqRanIntsGen(quesSel) {
  int ranIntA = ranIntGen(1, 200);
  while (ranIntA.toString() == questionsBox.get(quesSel)!.ans) {
    ranIntA = ranIntGen(1, 200);
  }

  int ranIntB = ranIntGen(1, 200);
  while (ranIntB == ranIntA ||
      ranIntB.toString() == questionsBox.get(quesSel)!.ans) {
    ranIntB = ranIntGen(1, 200);
  }

  int ranIntC = ranIntGen(1, 200);
  while (ranIntC == ranIntA ||
      ranIntC == ranIntB ||
      ranIntC.toString() == questionsBox.get(quesSel)!.ans) {
    ranIntC = ranIntGen(1, 200);
  }

  int ranIntD = ranIntGen(1, 200);
  while (ranIntD == ranIntA ||
      ranIntD == ranIntB ||
      ranIntD == ranIntC ||
      ranIntD.toString() == questionsBox.get(quesSel)!.ans) {
    ranIntD = ranIntGen(1, 200);
  }

  List<String> ranInts = [
    ranIntA.toString(),
    ranIntB.toString(),
    ranIntC.toString(),
    ranIntD.toString()
  ];
  return ranInts;
}

/* a random number generator customisable based on the smallest number and how
how large a range should be generated*/
int ranIntGen(int minNum, int range) {
  int integer = Random().nextInt(range) + minNum;
  return integer;
}

/* fetches each side of the equation of each question based on which widget has
called it (a=left and b=right) */
String queFetch(String quesSel, String qSide) {
  if (qSide == 'a') {
    return questionsBox.get(quesSel)!.num1;
  } else {
    return questionsBox.get(quesSel)!.num2;
  }
}

/* this decides, at random, which button is going to be the button with the
correct answer */
List<bool> getCorrectBut() {
  int randInt = ranIntGen(0, 4);
  if (randInt == 0) {
    correctButton = [true, false, false, false];
  } else if (randInt == 1) {
    correctButton = [false, true, false, false];
  } else if (randInt == 2) {
    correctButton = [false, false, true, false];
  } else if (randInt == 3) {
    correctButton = [false, false, false, true];
  }
  return correctButton;
}

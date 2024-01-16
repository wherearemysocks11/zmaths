import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'questions.dart';
import 'difficulty_screen.dart';
import 'settings.dart';

late Box<Questions> questionsBox;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  dbSetUp();
  runApp(
    const MaterialApp(
      title: 'ZMaths',
      home: MyFlutterApp(),
    ),
  );
}

class MyFlutterApp extends StatefulWidget {
  const MyFlutterApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyFlutterState();
  }
}

class MyFlutterState extends State<MyFlutterApp> {
  @override
  Widget build(BuildContext context) {
    // Variables to hold width/height so widgets can adjust spacing based on the page size
    double pageHeight = (MediaQuery.of(context).size.height);
    double pageWidth = (MediaQuery.of(context).size.width);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Center(
            child: Text('ZMaths',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600))),
      ),
      backgroundColor: const Color.fromARGB(255, 245, 176, 176),
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: pageHeight,
          width: pageWidth,
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                // Start button
                Padding(
                  padding: EdgeInsets.only(
                    bottom: pageHeight / 50,
                    top: pageHeight / 50,
                    left: pageWidth / 50,
                    right: pageWidth / 50,
                  ),
                  child: Align(
                    alignment: const Alignment(0.0, 0.0),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DifficultyScreen()),
                        );
                      },
                      color: const Color.fromARGB(255, 33, 134, 217),
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      textColor: const Color.fromARGB(255, 253, 254, 255),
                      height: 60,
                      minWidth: 140,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: const Text(
                        "Start",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                ),
                // Settings Button
                Padding(
                  padding: EdgeInsets.only(
                    bottom: pageHeight / 50,
                    top: pageHeight / 50,
                    left: pageWidth / 50,
                    right: pageWidth / 50,
                  ),
                  child: Align(
                    alignment: const Alignment(0.0, 0.0),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SettingsScreen()),
                        );
                      },
                      color: const Color.fromARGB(255, 33, 134, 217),
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      textColor: const Color.fromARGB(255, 253, 254, 255),
                      height: 60,
                      minWidth: 140,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: const Text(
                        "Settings",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> dbSetUp() async {
  // initiating and opening the database (a.k.a a box)
  await Hive.initFlutter();
  Hive.registerAdapter(QuestionsAdapter());
  questionsBox = await Hive.openBox<Questions>('questionsBox');

  // fetch the .csv file and turn it into a string using flutter services
  String csvLocation = "assets/questions.csv";
  String csvAsString = await rootBundle.loadString(csvLocation);

  // split the .csv as a string into its rows, each row represents a question
  List<String> questions = csvAsString.split("\n");

  // going through each row (question), splitting each one into its set of values
  for (int i = 0; i < questions.length; i++) {
    String question = questions[i];
    List<String> itemsQuestion = question.split(",");

    /* creating an input which is a Questions class and filling
    each field with the appropriate value from the split rows) */
    Questions input = Questions(
      (itemsQuestion[0]), // input.qnum
      (itemsQuestion[1]), // input.num1
      (itemsQuestion[2]), // input.num2
      (itemsQuestion[3]), // input.ans
    );
    /* putting the data (input) into the database/box (questionsBox), the first
    field is the primary key and the second field is the data */
    questionsBox.put(input.qnum, input);
  }
  /* below is a line of code for checking the data has been inputted into the 
  database/box correctly */
  //print(questionsBox.get('2')!.num1);
}

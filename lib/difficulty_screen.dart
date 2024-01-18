import 'package:flutter/material.dart';
import 'activity_screen.dart';

class DifficultyScreen extends StatefulWidget {
  const DifficultyScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return DifficultyScreenState();
  }
}

class DifficultyScreenState extends State<DifficultyScreen> {
  @override
  Widget build(BuildContext context) {
    double pageHeight = (MediaQuery.of(context).size.height);
    double pageWidth = (MediaQuery.of(context).size.height);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text(
          'Z-Maths',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 245, 176, 176),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                          builder: (context) =>
                              ActivityScreen(difficulty: 'Easy')),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: const Text(
                    "Easy",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),
            ),
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
                          builder: (context) =>
                              ActivityScreen(difficulty: 'Medium')),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: const Text(
                    "Medium",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),
            ),
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
                          builder: (context) =>
                              ActivityScreen(difficulty: 'Hard')),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: const Text(
                    "Hard",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

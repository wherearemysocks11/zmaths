import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return SettingsScreenState();
  }
}

class SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    // Variables to hold width/height so widgets can create padding based on the page size
    double pageHeight = (MediaQuery.of(context).size.height);
    double pageWidth = (MediaQuery.of(context).size.width);

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.red,
            title: const Center(
                child: Text('ZMaths',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.w600)))),
        backgroundColor: const Color.fromARGB(255, 245, 176, 176),
        body: Align(
            alignment: Alignment.center,
            child: SizedBox(
                height: pageHeight,
                width: pageWidth,
                child: Stack(alignment: Alignment.topLeft, children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                              bottom: pageHeight / 50,
                              top: pageHeight / 50,
                              left: pageWidth / 50,
                              right: pageWidth / 50,
                            ),
                            child: const Align(
                                alignment: Alignment(0.0, 0.0),
                                child: Text(
                                  'Settings Page',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 50,
                                      fontWeight: FontWeight.w600),
                                )))
                      ])
                ]))));
  }
}

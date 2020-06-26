import 'package:NewFlutterApp/question.dart';
import 'package:flutter/material.dart';
import 'package:NewFlutterApp/button.dart';

class StatePage extends StatefulWidget {
  StatePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _StatePage createState() => _StatePage();
}

class _StatePage extends State<StatePage> {
  int _questionIndex = 0;
 final _question = const[
    {
      'question': 'What are you doing ?',
      'answer': ['Coding', 'Sleeping', 'Playing']
    },
    {
      'question': 'Where are you staying ?',
      'answer': ['India', 'Malaysia', 'UK']
    },
    {
      'question': 'Which is your favourite sport ?',
      'answer': ['Cricket', 'Football', 'Badminton']
    }
  ];

  void _changeQuestion() {
    setState(() => _questionIndex++);

  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            children: <Widget>[
              Question(
                _question[_questionIndex]['question'],
              ),
              Container(
              //  width: double.infinity,
                child: Column(

                  children: <Widget>[
                  ...(_question[_questionIndex]['answer'] as List<String>)
                      .map((_answer) {
                    return FancyButton(
                        onPressedHandler: _changeQuestion,
                        questionIndex: _questionIndex,
                        answerText: _answer);
                  }).toList(),
                ]),
              ),
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
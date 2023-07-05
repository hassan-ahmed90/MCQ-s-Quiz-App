import 'dart:html';

import 'package:flutter/material.dart';
import 'package:mcqs_app/quiz_brain.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);
  @override
  State<QuizPage> createState() => _QuizPageState();
}
class _QuizPageState extends State<QuizPage> {
  QuizBrain brain = QuizBrain();

  List <Icon> scoreKeeper=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 5,
              child: Container(
                color: Colors.black,
                child: Center(
                  child: Text(
                    brain.getQuestion(),
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              )),
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                bool correctAns= brain.getAnswers();
                if(correctAns==true){
                  scoreKeeper.add(Icon(Icons.check,color: Colors.green,));
                }
                else{
                  scoreKeeper.add(Icon(Icons.close,color: Colors.red,));
                }
                setState(() {
                  brain.nextQuestion();

                });
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    "True",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          )),
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                bool correctAns= brain.getAnswers();
                if(correctAns==false){
                  scoreKeeper.add(Icon(Icons.check,color: Colors.green,));
                }
                else{
                  scoreKeeper.add(Icon(Icons.close,color: Colors.red,));
                }
                setState(() {
                  brain.nextQuestion();
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    "False",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          )),
          Row(
            children: scoreKeeper,
          )
        ],
      ),
    );
  }
}

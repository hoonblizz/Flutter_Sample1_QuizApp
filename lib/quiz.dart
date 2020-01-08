import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    @required this.questions, 
    @required this.answerQuestion, 
    @required this.questionIndex
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // question 파일에서 생성한 Question class
        // List<Map<String, Object>> 라는건, List of Map that is formed with String and Object as a pair.
        // [{'text': 'hi', 'score': 1}, {....}]
        Question(questions[questionIndex]['questionText']),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).map((answer) {
          return Answer(() => { answerQuestion(answer['score']) }, answer['text']);
        }).toList()
      ],
    );
  }
}

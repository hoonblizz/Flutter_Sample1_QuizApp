import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  int totalScore;
  Function resetQuiz;

  Result({this.totalScore, this.resetQuiz}); // {} 를 이용해서 named argument 로 만들어 줍니다.

  // Getter 란 method 와 property 를 합쳐놓은 것입니다.
  String get resultPhase {
    var resultText = 'You did it! ${totalScore}';
    if (totalScore < 5) {
      resultText = 'Total score is not high! ${totalScore}';
    } else if (totalScore <= 10) {
      resultText = 'Total score is high! ${totalScore}';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Restart Quiz!'),
            textColor: Colors.blue,
            onPressed: resetQuiz,
          ),
        ],
      ),
    );
  }
}

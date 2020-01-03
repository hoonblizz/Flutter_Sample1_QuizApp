import 'package:flutter/material.dart';

class Answer extends StatelessWidget {

  // Function 타입을 불러옵니다. 
  // main.dart 에 보면 미리 만들어진 function 이 있는데, 그걸 넣어줍니다.
  final Function selectHandler; 
  final String answerText;

  Answer(this.selectHandler, this.answerText);   // Constructor

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        child: Text('Answer button 1'),
        onPressed: selectHandler,
      ),
    );
  }
}

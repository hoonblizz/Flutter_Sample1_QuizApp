import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  // final 은 이 variable 이 바뀌지 않는다는걸 의미합니다. reassign 이 안됩니다.
  final String questionText;

  // Constructor 입니다.
  Question(this.questionText);

  @override
  Widget build(BuildContext context) {

    // CSS 하듯이 구조를 잡아준다.
    // padding 과 margin 도 CSS 와 컨셉이 똑같다. 
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}

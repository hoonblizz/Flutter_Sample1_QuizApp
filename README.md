# flutter_sample_quiz_app

연습용 프로젝트

## 유용한 사이트들

- [다트 연습용 콘솔](https://dartpad.dartlang.org/)
- [플러터 샘플](https://flutter.dev/docs/cookbook)

## VS Code 사용시 
### 에물레이터로 실행 방법: <br>
상단 메뉴중에 Debug -> Debuggin 옵션
### 위젯 옵션 보기:
Control + Space
### 코드를 Readable 하게 줄 맞추기:
상단에 Code -> Preferences -> Keyboard shortcuts <br>
서치바에 format document 찾기 <br>
거기 나온 키 외우고, 코드에 적용시켜보기 <br>
`Shift + option(alt) + F` <br>
이걸 위해서는 `,` <- 이걸 적절히 잘 붙여주는게 중요! 


## 이름 짓는법
Camel Case 형식으로 첫글자는 소문자, 그 다음은 단어 시작 첫글자마다 대문자로 싸줍니다. 

## Data Types, Return Types
기존의 OOP 언어들과 비슷합니다. 
```dart
double addNumber (double a, double b) {
  return a + b;
}

void main() {

  print(addNumber(1, 3.2));
  
  // Declare 먼저 해주는 경우에는, 타입을 정해주고 나중에 assign 하는게 좋고,
  // 직접 사용될때는 var 로 해도 괜찮습니다. addNumber 의 리턴 타입이 더블이기때문에
  // var 에 더블이 자연스럽게 들어가게 됩니다.
  // 예제:
  double firstAddition;
  firstAddition = addNumber(4, 5);
  print(firstAddition);
   
  var secondAddition = addNumber(4, 5);
  print(secondAddition);

  print(firstAddition + secondAddition);

}
```

## Class 
다트는 OOP 이기 때문에, Class 지정해주는게 중요합니다. 
기본은 다른 언어들과 크게 다르지 않고 익숙합니다.
```dart
class Person {
  String name = 'Taehoon';
  int age = 33;
  
  // 이렇게 클래스 안에 넣어서 쓰기도 합니다.
  double addNumber (double a, double b) {
    return a + b;
  }
  
}


void main() {
  
  // 다트에서는 new 로 선언하지 않아도 괜찮습니다.
  var person1 = new Person();
  var person2 = Person();
  print('Person 1 age is ${person1.age}');  // JS 에서도 쓰이는 스트링 빌더와 같습니다.
  
  // 물론 값을 assign 하는것도 됩니다.
  person2.age = 99;
  print('Person 2 age is ${person2.age}');
  
  // == 로 확인해보면
  print(person1.name == person2.name); // 값을 비교하는건 직관적입니다.
  
  // 클래스 비교해보면 다르다는걸 알수 있습니다.
  person2.age = 33;
  print(person1 == person2);
  
  // 클래스안의 function 에 접근
  var added = person1.addNumber(1, 2.2) + person2.addNumber(3.1, 4.1);
  print(added);
  
}
```

## Class Constructor, Named Arguments
역시 기존의 OOP 와 흡사하지만, 조금 더 간단하게 됩니다. <br>
Dart 에서는 해당 클래스의 이름을 한번 더 불러줌으로서 Constructor 의 역할을 합니다. <br><br>

Constructor 에서 {} 컬리 브레켓으로 argument 를 감싸주면, 
다음과 같이 argument 입력시 키 이름을 정해줄수 있습니다. 
(Named Argument 로 만들어줍니다)

```dart
class Person {
  String name; int age;
 
  Person({ String inputName, int age }) {
    
    // variable 이름을 다르게 하면, 그냥 assign 해주면 됩니다.
    name = inputName;
     
    // variable 이름을 같게 만들었다면, this를 써서 assign 합니다.
    this.age = age;
    
  }
  
}

void main() {
  var p1 = Person(age: 33, inputName: 'Taehoon');
  print(p1.name);
}
```
<br>

Argument 값들을 넣어주는게 당연한 과정일 경우에는, 더욱 간단한 방법이 있습니다. <br>
컬리 프레킷과 this 를 이용해서 단번에 assign 해줄수 있습니다.

```dart
class Person {
  String name; int age;
  
  Person({String this.name, int this.age});
  
}

void main() {
  var p1 = Person(age: 33, name: 'Taehoon');
  print(p1.name);
}
```
<br>

추가적으로, 기본값을 넣어주거나, @require 를 이용한 필수값을 지정해 줄수 있습니다.
```dart
Person(@require String name, int age = 30) {...}
```

## 기본 흐름
`runApp` 이 build 를 실행시키고, 그 안의 `context` 와 위젯들을 빌드해서
하나의 위젯으로 리턴해서 화면서 보여줍니다. <br>
(자세한건 코드의 코멘트 참조)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {  

  Widget build(BuildContext context) {
    return MaterialApp(home: Text('Hello World'));
  }

}
```

## UI 트리 구조
플러터는 모든것이 위젯이고, 모든 위젯은 트리 구조로 이루어져야 합니다. <br>
다음의 예제에서 보면, `MaterialApp` 안의 `home` 이라는 named argument 에 <br>
UI specification 을 담당하는 `Scaffold` 가 들어가 있고, <br>
`Scaffold` 의 named argument 로서 `appBar` 안에 `AppBar` 라는 위젯이 들어가 있고, <br>
`AppBar` 의 named argument 로서 `title` 안에 `Text` 위젯이 들어가 있습니다. <br><br>
이렇게 반복적으로 트리의 형태를 띄게끔 구조를 설계하는것이 플러터의 기본입니다.

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('App bar title here'),
        ),
        body: Text('This is body text'),
      ),
    );

  }
}

```

## Visible / Invisible Widgets
Output, Input 에 관련된 위젯들은 Visible, <br>
( `RaisedButton()`, `Text()`, `Card()` ...) <br><br>
Layout, Control 에 관련된 위젯은 Invisible 하다. <br>
(`Row()`, `Column()`, `ListView()`, ...) <br><br>
Invisible 위젯이 필요한 상황이란, 바로 밑의 예제에서처럼 <br>
`home` -> `body` 그리고 바디 안에 `Text` 외에도 다른 많은 위젯을 생성하고 싶을때 사용된다.

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('App bar title here'),
        ),
        body: Text('This is body text'),
      ),
    );

  }
}

```
이때, Layout Widget 을 사용하면 더 많은 위젯을 알맞게 넣을수 있게 된다. <br>

```dart
...
body: Column(
  children: [
    Text(questions[questionIndex]),
    RaisedButton(
      child: Text('Answer button 1'),
      onPressed: answerQuestion,
    ),
    RaisedButton(
      child: Text('Answer button 2'),
      onPressed: () => print('Answer 2 chosen'),
    ),
    RaisedButton(
      child: Text('Answer button 3'),
      onPressed: () => {
        print('Answer 3 chosen')
      },
    ),
  ],
),
...
```

## Stateful Widget
`State` 란? <br>
React 의 State 처럼 앱의 데이타를 뜻한다. 즉, Stateful Widget 은 데이타가 관여되는 위젯, Stateless Widget 은 데이타가 관여되지 않은 순수한 위젯이라 할수있다.
<br><br>
예를들어 Stateless Widget 의 경우, <br>
`Input Data` -> `Widget (no state)` -> `Render UI` <br>
이처럼 위젯이 input data 만 갖고 렌더링 하게 된다. (`Text()` 처럼.) <br><br>
하지만 Stateful Widget 의 경우, <br>
`Input Data` -> `Widget (internal state)` -> `Render UI` <br>
이처럼 위젯이 input data 혹은 위젯 내부의 state 에 따라 무엇을 렌더링 할건지 결정된다. <br><br>

<b>Stateful Widget 만드는 방법</b>: <br>
Stateless widget 의 경우엔, 
```dart
class MyApp extends StatelessWidget { ... }
```
이렇게 되어있는데, 여기서 StatefulWidget 이라고 바꾼다고 간단히 바뀌지는 않는다. <br>
Stateless 와는 다르게 Stateful widget 은 두 클래스로 구성되어 있다. <br>
<br>
StatefulWidget 안에 `createState` 를 쳐주면 자동완성으로 <br>

```dart
@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
```
이렇게 완성된다. <br>
이 내용을 살펴보면, `createState` 는 아무런 argument 없이 <br>
`StatefulWidget` 에 속하는 `State` 타입의 데이타를 리턴해준다. <br>
여기에 `State` 를 extend 해주는 클래스를 만들어서 연결시켜 줌으로서 비로소 Stateful widget 이 된다. 
<br><br>

그리고 State 에 변화를 줌으로 해서 렌더링이 생기는데, State 값을 직접적으로 바꾸는것은 효과가 없고, `setState` 를 이용해서 바꿔줘야만 한다.<br>

```dart
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

// State<MyApp> 은 State 가 MyApp 에 속한다 라는걸 나타내 준다. 
// State 가 Generic type 이기 때문.
class MyAppState extends State<MyApp> {
  var questionIndex = 0;

  void answerQuestion() {

    // setState 로 State 에 변화를 준다.
    setState(() {
      questionIndex++;
    });

  }

  var questions = [
    'What\'s your favorite colour?',
    'What\'s your favorite animal?',
    'A', 
    'B'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('App bar title here'),
        ),
        body: Column(
          children: [
            Text(questions[questionIndex]),
            RaisedButton(
              child: Text('Answer button 1'),
              onPressed: answerQuestion,
            ),

    ......
  }
}
```

## Private Property
다른 OOP 언어들처럼 Private 은 다른 클래스가 엑세스하는것을 막아준다. <br>
다트에서 Private 적용하는 방법은, `_` 언더스코어 를 이름앞에 붙여주는것. <br><br>
밑의 예제에서 보면, <br>
`_MyAppState` 처럼 클래스에 붙일수도 있고, <br>
`_questionIndex` 처럼 variable 에 붙여도 되고, <br>
`_answerQuestion` 처럼 function / method 에 붙일수도 있다. <br>

```dart
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex++;
    });
    print('Answered 1: ');
  }
  ....
```

## 새 위젯 추가하기
보통은 한 dart 파일에 하나의 위젯이 들어가는게 이상적이다. (가끔 예외가 있을수는 있어도) <br>
새 위젯을 추가하려면, `lib` 폴더에 dart 파일을 추가하고, 그 파일 가장 첫출에 <br>
`st` 라고 쳐보면, VSCode 의 recommendation이 나온다. <br>
예를들어, `Flutter stateful widget`, `Flutter stateless widget`... <br>
이중에서 그냥 선택하기만 하면 기본 코드가 준비된다.
<br><br>
이 예제에서 `question.dart` 라는 파일을 만들고, `Question` 이라는 stateless 클래스를 만들었다.
<br>
이제 `main.dart` 에 있는 variable 을 `question.dart` 로 가져와서 쓰는법을 알아보자. 
<br>
`question.dart` 에서 Constructor 로 variable 값을 선언해주고, <br>
`main.dart` 에서 `import` 로 불러온 다음에 곧바로 class 이름으로 사용해주면 된다.<br>

### question.dart
```dart
import 'package:flutter/material.dart';

class Question extends StatelessWidget {

  // final 은 이 variable 이 바뀌지 않는다는걸 의미합니다. reassign 이 안됩니다.
  final String questionText; 

  // Constructor 입니다. 
  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Text(questionText);
  }
}
```
### main.dart
```dart
import 'package:flutter/material.dart';
import './question.dart';   // question 파일을 부른다

...

class _MyAppState extends State<MyApp> {

  ...

  Widget build(BuildContext context) {
    
    ...

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('App bar title here'),
        ),
        body: Column(
          children: [
            // question 파일에서 생성한 Question class
            Question(
              questions[_questionIndex]
            ),
            
            ...

```

## Styling, Layouting
예를들어 `Text()` 를 스타일링 해준다고 하면, <br>
Named argument 로 `style` 이라는게 있다. <br>
그리고 style 위에 마우스를 올려보면, `TextStyle()` 이 들어간다고 하는데, <br>
`TextStyle()` 을 써주고 또 마우스를 올려보면, 갖가지 옵션들이 나온다. <br>
예를들어, `color`, `fontSize`, 기타등등. <br>
<br>
또 다른 named argument 예로는, `textAlign` 이 있다. 역시 똑같이 마우스를 올려보면, `TextAlign` 이 들어가고, 이 위에 마우스를 올려보면, `enum` 이라고 하면서 설명이 나오는데, <br>
`enum` 이란 미리 준비된 값이 있다는 뜻이다. 그러므로 `TextAlign`에 `.` 점을 붙여보면, 사용가능한 옵션들이 나온다.<br>
기본적으로 이런식으로 안에 들어가는 data type 과 return type 을 알아가면서 쓰면 된다. <br>

```dart
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
      margin: EdgeInsets.all(20), // EdgeInsets.only(...) 는 일부분만 적용 할때.
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
```
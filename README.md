# flutter_sample_quiz_app

연습용 프로젝트 입니다. <br>
소스: [Learn Flutter & Dart to Build iOS & Android Apps](https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps)
<br>

![completed sample](/flutter_sampleApp_1.gif)

## Index
| Title | Desc |  
| :--- | :---:  | 
| [Data Types, Return Types](#data-types-return-types) | ..|
| [Class](#class) | ..|
| [Class Constructor, Named Arguments](#class-constructor-named-arguments) | ..|
|[Basic Flow](#basic-flow) | ..|
|[UI Tree Structure](#ui-tree-structure) | ..|
|[Visible / Invisible Widgets](#visible--invisible-widgets) | ..|
|[Stateful Widget](#stateful-widget) | ..|
|[Private Property](#private-property) | ..|
|[Adding New Widgets](#adding-new-widgets) | ..|
|[Styling, Layouting](#styling-layouting) | ..|
|[Multiple / Extra Constructor](#multiple--extra-constructor) | ..|
|[Map](#map) | ..|
|[final vs const](#final-vs-const) | ..|
|[Splitting App](#splitting-app) | ..|
|[Getter](#getter) | ..|


## 유용한 사이트들

- [다트 연습용 콘솔](https://dartpad.dartlang.org/)
- [플러터 샘플](https://flutter.dev/docs/cookbook)

## VS Code 사용팁
### 에물레이터로 실행 방법: <br>
상단 메뉴중에 Debug -> Debuggin 옵션
### 코드를 Readable 하게 줄 맞추기:
상단에 Code -> Preferences -> Keyboard shortcuts <br>
서치바에 format document 찾기 <br>
거기 나온 키 외우고, 코드에 적용시켜보기 <br>
`Shift + option(alt) + F` <br>
이걸 위해서는 `,` <- 이걸 적절히 잘 붙여주는게 중요! 
### 가능한 argument 나 위젯 옵션 보기
예를들어 `Quiz()` 가 있으면, ( )안에 커서를 넣고, `control + space`. <br> 
### Refactoring
예를들어 
```dart
return Center(
      child: Text(...
```
이렇게 되어있는 코드가 있는데, `Text` 부분을 `Column` 으로 감싸고 싶을때, `Refactoring` 옵션이 필요.<br>
상단에 `Code -> Preference -> Keyboard Shortcut` <br>
그리고 `refactor` 를 찾아보면 단축키가 나온다. 내 경우에는 `Shift + Control + R`. <br>
`Text` 부분에 마우스를 찍어주고 단축키를 누르면 옵션들이 나온다. 

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

## Basic Flow
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

## UI Tree Structure
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

## Adding New Widgets
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
(Tip: `Cmd` 누르고 `TextAlign()` 에 마우스를 후버 해보면, 링크가 되어있다. 클릭해서 들어가보면 더 자세한 설명이 나온다) <br><br>
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

## Multiple / Extra Constructor
한 클래스에서 쉽게 Constructor 를 preset 하는 방법이 있다. <br>
예를들어 두명의 유저를 만들어야 할때, 보통은 <br>

```dart
class Person {
  String name;
  int age;
  
  Person({String this.name, int this.age});
  
}


void main() {
  
  var p1 = Person(age: 33, name: 'Taehoon');
  var p2 = Person(age: 22, name: 'Taehoon2');
  
  print(p1.name);
  print(p2.name);
  
}
```

이렇게 값을 하나씩 넣어주면서 생성해야 하지만, 만약 preset 이 가능한 부분이 있다면,<br>
다음과 같이 클래스 안에서 또다시 Constructor 를 만들어주는게 가능하다. <br>

```dart
class Person {
  String name;
  int age;
  
  // Constructor 1
  Person({String this.name, int this.age});
  
  // Constructor 2 - 이런식으로 사용 가능
  Person.presetTaehoon({String this.name}) {
    age = 72;
  }
  
}


void main() {
  
  var p1 = Person(age: 33, name: 'Taehoon');
  var p2 = Person(age: 22, name: 'Taehoon2');
  var p3 = Person.presetTaehoon(name: 'Taehoon3');
  
  print(p1.name);
  print(p2.name);
  print('${p3.name}: ${p3.age}');
  
}
```

## Map
`map` 은 javascript 에서 object 와 비슷한 개념이다. 

```dart
var questions = [
    {
      'questionText': 'What\'s your favorite colour?', 
      'answers': ['Black', 'red', 'green', 'white']
    },
    {
      'questionText': 'What\'s your favorite animal?', 
      'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion']
    },
    {
      'questionText': 'What\'s your favorite food?', 
      'answers': ['Pizza', 'Burgur', 'Pasta', 'Kimchi']
    },
  ];

  print(questions[0]['questionText']);
```
하지만 javascript 처럼 `questions[0].questionText` 이런 신택스로는 쓸수 없다. <br>
<br>
그러면 `map` 을 사용할때는 어떨까? <br>
javascript 하듯이 다음 과 같이 해보면, 에러가 난다.

```dart
// 이미 생성된 object 에서 answer 부분을 map 으로 돌려주고 싶다. 
questions[_questionIndex]['answers'].map((answer) {
  return Answer(answer);
})
```
이유는, dart 가 `questions[_questionIndex]['answers']` 의 데이타 타입이 array 인걸 알수 없어서 그런것. 이 부분을 확실히 해줘야 한다.<br>

```dart
...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
  return Answer(_answerQuestion, answer);
}).toList()
```

뭔가 많이 달라보이는데, 하나하나 짚어보면, <br>
`as List<String>` 으로 `questions[_questionIndex]['answers']` 가 String 으로 구성된 리스트임을 확실히 해둔다. <br>
뒤에 `.toList()` 로 `map` 이 `List` 로 전환되게 한다. <br> 
앞에 `...` Spread operator 로 `List`로 전환 된 값들을 밖으로 뽑아내서 붙여준다.<br> 
javascript 에서의 spread operator 는 deep copy 를 해주는건데, 아마 비슷할듯 하다. <br>

## final vs const
`final`은 runtime 때부터 정해진 값이다. `const` 는 코드가 돌아가는 동안에 바뀌지 않도록 결정된 값이다. <br>
예를들어, 어떤 iterator 가 있고, 그 안에 `final` 을 쓰면, iterator가 무슨짓을 해도 절대 변하지 않는다. 하지만 `const` 를 쓰면, 해당 iterator 안에서 불변하는 값으로 쓰이는것. <br><br>
이걸 써주는데 두가지 방법이 있다. 하나는 variable 이름 앞에 붙여주는것. 다른 하나는 실제 value 앞에 붙여주는것. 
```dart
// 두 장소에 쓰일수 있다.
const dummy = const ['Hello'];
```
variable 이름 앞에 붙이면 말 그대로 그 variable 자체가 묶이게 된다. 예를들어, 
```dart
const dummy = ['Hello'];
dummy = [];   // 에러
```
실제 value 앞에 써주면, value 를 바꾸는 행위를 못하게 된다. 
```dart
var dummy = const ['Hello'];
dummy.add('Max'); // 에러
```
<br>

## Splitting App
예를들어, 다음의 코드가 있다고 하자.
```dart
return MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: Text('App bar title here'),
    ),
    body: (_questionIndex < questions.length)
        ? Column(
            children: [
              // question 파일에서 생성한 Question class
              Question(questions[_questionIndex]['questionText']),
              ...(questions[_questionIndex]['answers'] as List<String>)
                  .map((answer) {
                return Answer(_answerQuestion, answer);
              }).toList()
            ],
          )
        : Center(
            child: Text('You did it!'),
          ),
  ),
);
```
코드가 조금 복잡해지거나, 혹은 추후에 복잡해질 가능성이 있다면 일단 쪼개주는게 좋다. <br>
위의 예제에서 `body` 부분을 조건문으로 나눠줌으로 해서 일단 한눈에 들어오기 어렵게 되었고, 나중에 각각의 조건문이 더욱 복잡해질 가능성이 있다고 가정하고 이걸 쪼개보도록 한다. <br><br>
우선 추가적으로 `dart` 파일을 만들어준다. `quiz.dart`, `result.dart` 정도가 좋겠다. <br>

### quiz.dart
```dart
import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {

  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  // @required 를 쓰려면 named argument 로 만들어 줘야 하기 때문에, 
  // main.dart 에서 named 로 만들어준다.
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
        Question(questions[questionIndex]['questionText']),
        ...(questions[questionIndex]['answers'] as List<String>).map((answer) {
          return Answer(answerQuestion, answer);
        }).toList()
      ],
    );
  }
}

```

### result.dart
```dart
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('You did it!'),
    );
  }
}
```

### main.dart
```dart
...
...
Widget build(BuildContext context) {
  return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('App bar title here'),
      ),
      body: (_questionIndex < _questions.length)
          ? Quiz(
              answerQuestion: _answerQuestion,  // @ required 쓰기 위해 named 로 만든다.
              questionIndex: _questionIndex,
              questions: _questions,
            )
          : Result(),
    ),
  );
}
```

## Getter
`Getter` 란 method 와 property 를 합쳐놓은 것입니다. <br>
예를들어, <br>

### result.dart
```dart
class Result extends StatelessWidget {
  int totalScore;

  Result({this.totalScore}); // {} 를 이용해서 named argument 로 만들어 줍니다.

  String get resultPhase {    // Getter 입니다.
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
      child: Text(
        resultPhase,
        style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
      ),
    );
  }
}
```

리턴타입 그리고 `get` 을 붙임으로 Getter 를 만들수 있습니다.  <br>
Getter 에는 argument 가 못들어가므로, 주의해서 써야합니다.


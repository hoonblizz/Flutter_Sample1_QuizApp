# flutter_sample_quiz_app

연습용 프로젝트

## 유용한 사이트들

- [다트 연습용 콘솔](https://dartpad.dartlang.org/)
- [플러터 샘플](https://flutter.dev/docs/cookbook)

## 이름 짓는법
Camel Case 형식으로 첫글자는 소문자, 그 다음은 단어 시작 첫글자마다 대문자로 싸줍니다. 

## 데이타 타입, 리턴 타입
기존의 OOP 언어들과 비슷합니다. 
```
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
```
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


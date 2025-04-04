void exampleLambda() {
  // 기본 람다 테스트
  int addLambda(int a, int b) => a + b;
  print(addLambda(3, 5));

  int multiply(int a, int b) => a * b;
  print(multiply(4, 6));

  bool isEvenLambda(int input) => input % 2 == 0;
  print(isEvenLambda(7));

  bool isLongString(String input) => input.length >= 5;
  print(isLongString("hello"));
  print(isLongString("hi"));

  // 람다 없이 클래스 정의시 모든 동작을 직접 정의. 이렇게하면 소문자는?
  UpperCaseTransformer transformer = UpperCaseTransformer();
  print(transformer.transform("hello"));

  // OCP 원칙을 적용하여 기존 코드를 수정하지 않고 새로운 기능 추가.
  Multiplier doublerMultiplier = Multiplier((num) => num * 2);
  print(doublerMultiplier.multiply(5));

  Multiplier tripleMultiplier = Multiplier((num) => num * 3);
  print(tripleMultiplier.multiply(4));

  StringTransformer upperCaseTransformer = StringTransformer((text) => text.toUpperCase());
  print(upperCaseTransformer.transform("hello"));
}

class Multiplier {
  final int Function(int) calculate;

  Multiplier(this.calculate);

  int multiply(int value) {
    return calculate(value);
  }
}

class StringTransformer {
  final String Function(String) transform;

  StringTransformer(this.transform);

  String applyTransform(String input) {
    return transform(input);
  }
}

class UpperCaseTransformer {
  String transform(String text) {
    return text.toUpperCase();
  }
}
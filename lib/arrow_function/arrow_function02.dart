void exampleArrowFunction() {
  final counter = notifierFunction();
  counter.increment();
  print(counter.count);

  int add(int x, int y) => x + y;
  int subtract(int x, int y) => x - y;

  print(operate(add, 1, 2));
}

final String Function(String) myFunction = (String name) {
  return "Hello, $name";
};

final int Function(int, int) add = (int a, int b) => a + b;

int operate(int Function(int, int) operation, int a, int b) {
  return operation(a, b);
}

// 항상 반환타입을 명확하게 지정해주자.
final Counter Function() notifierFunction = () => Counter();

class Counter {
  int count = 0;

  void increment() => count++;
}

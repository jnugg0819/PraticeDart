class Example {
  const Example();
}

void getExample() {
  // const를 사용했으므로 dart가 객체를 캐싱하여 재사용.
  // const Example() 생성자로 만든 객체는 한 번 생성되면 동일한 인스턴스 재사용. 즉 같은 메모리 주소를 사용하고 있음.
  const Example obj1 = Example();
  const Example obj2 = Example();

  print(identical(obj1, obj2));

  // Example()을 호출할 때마다 새로운 객체가 생성됨.
  Example obj3 = Example();
  Example obj4 = Example();
  print(identical(obj3, obj4));
}
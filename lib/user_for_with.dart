
/// mixin을 사용하면 코드 재사용성 향상, 기능의 모듈화, 유연한 코드 구성.
/// 생성자 정의 불가, 메서드 충돌이 발생할 수 있다. 만약 메서드 충돌 시 마지막 믹스인이 우선 적용된다.
/// 클래스의 기능을 inject 하는 매커니즘이라고 보면 된다.
///
/// in Kotlin
///
/// interface Logger {
///     fun log(message: String)
/// }
///
/// interface Validator {
///     fun isValid(input: String): Boolean
/// }
///
/// class User : Logger, Validator {
///     override fun log(message: String) {
///         println("Log: $message")
///     }
///
///     override fun isValid(input: String): Boolean {
///         return input.isNotEmpty()
///     }
/// }
///
/// 주요 차이점:
/// | 특징 | Kotlin interface | Dart mixin |
/// |------|-----------------|------------|
/// | 구현 | 추상 메서드와 기본 구현 가능 | 구체적인 구현만 가능 |
/// | 상태 | 프로퍼티 선언만 가능 | 상태(변수)를 가질 수 있음 |
/// | 다중 상속 | 인터페이스는 여러 개 구현 가능 | 여러 믹스인 사용 가능 |
/// | 생성자 | 없음 | 없음 |
/// | 사용 키워드 | : (implements) | with |
/// | 상태 | 가질수 없음 | 가질수 있음 | -> 상태란 내부에서 변수를 선언하고 값을 저장 할 수 있다는 의미.

// mixin Logger {
//   void log(String message) {
//     print('Log: $message');
//   }
// }

// mixin Validator {
//   bool isValid(String input) {
//     return input.isNotEmpty;
//   }
// }
//
// mixin Counter {
//   int _count = 0;
//
//   int get count => _count;
//
//   void increment() {
//     _count++;
//     print('Count: $_count');
//   }
//
//   void reset() {
//     _count =0;
//     print('Count reset to 0');
//   }
// }

// class User with Logger, Validator {
//   //이미 구현된 메서드 그대로 사용하면됨.
// }

/// on의 예시
/// on은 mixin의 사용을 특정 클래스로 제한하는 역할을 한다
/// mixin이 사용될수 있는 클래스를 제한
/// 특정 클래스의 하위 클래스만 mixin사용가능
///

// Logger mixin은 Loggable 인터페이스를 구현한 클래스에서만 사용가능.
mixin Logger on Loggable {
  void log(String message) {
    print('${this.name}:$message');
  }
}

abstract class Loggable {
  String get name;
}

class User implements Loggable {
  final String name;
  User(this.name);
}

class UserWithLogger extends User with Logger {
  UserWithLogger(String name) : super(name);
}
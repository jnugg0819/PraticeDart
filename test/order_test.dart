import 'package:dart_pratice/syntax-exercises/order.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  String testOrderSheet = "노트북,1500000,2;마우스,25000,3;키보드,75000,1;노트북,1500000,1";

  test("중복을 허용하지 않은 상품 목록을 가지고 온다", () {
    Order order = Order(testOrderSheet);

    Set<String> productOrderList = order.getProductOrderList();

    expect(productOrderList, equals({"노트북", "마우스", "키보드"}));
  });

  test("상품의 수량을 합산하여 저장한다 단 중복은 허용한다", () {
    Order order = Order(testOrderSheet);
    int productCount = order.getProductOrderCount();

    expect(4, productCount);
  });

  test("노트북 상품의 총가격은 450만원이다", () {
    Order order = Order(testOrderSheet);
    int priceOfProduct = order.getPriceEachProduct("노트북");
    expect(4500000, priceOfProduct);
  });

  test("총 주문 계산 금액은 465만원이다", () {
    Order order = Order(testOrderSheet);
    int totalPrice = order.getTotalPriceOfProducts();
    expect(4650000, totalPrice);
  });

  test("잘못된 형식의 주문양식 포맷이 들어가면 예외를 던진다", () {
    String invalidOrderSheet =
        "노트북,1500000;마우스,25000,3;키보드,75000,1;노트북,1500000,1";
    Order order = Order(invalidOrderSheet);
    expect(() => order.getOrderList(), throwsA(isA<FormatException>()));
  });
}

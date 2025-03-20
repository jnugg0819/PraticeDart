class Order {
  String orderSheet;

  Order(this.orderSheet);

  List<String> getOrderList() {
    List<String> orderList = orderSheet
        .split(";")
        .map((e) => e.trim()) // 각 아이템마다 빈값이 있을수 있으므로.
        .toList()
        .where((e) => e.isNotEmpty) // 빈 요소는 리스트에 넣어주지 않습니다.
        .toList();

    // 만약 주문목록 내부 각 아이템 요소가 3이 아닐경우엔 Exception.
    for (var item in orderList) {
      List<String> specificOrder = item.split(",");
      if (specificOrder.length != 3) {
        throw FormatException("Invalid order format");
      }
    }

    return orderList;
  }

  Map<String, int> getProductPriceMap() {
    Map<String, int> productPrice = {};

    List<String> orderList = getOrderList();

    for (var item in orderList) {
      List<String> specificOrder = item.split(",");

      int increment = (int.tryParse(specificOrder[1]) ?? 0) *
          (int.tryParse(specificOrder[2]) ?? 0);

      if (productPrice.containsKey(specificOrder[0])) {
        productPrice[specificOrder[0]] =
            (productPrice[specificOrder[0]] ?? 0) + increment;
      } else {
        productPrice[specificOrder[0]] = increment;
      }
    }

    return productPrice;
  }

  Set<String> getProductOrderList() {
    List<String> orderList = getOrderList();
    return orderList.map((e) => e.split(",").first).toSet();
  }

  int getProductOrderCount() {
    return getOrderList().length;
  }

  int getPriceEachProduct(String name) {
    return getProductPriceMap()[name] ?? 0;
  }

  int getTotalPriceOfProducts() {
    Map<String, int> productPriceMap = getProductPriceMap();
    return productPriceMap.sumValues();
  }
}

extension SumExtension on Map<String, int> {
  int sumValues() => values.fold(0, (prev, value) => prev + value);
}

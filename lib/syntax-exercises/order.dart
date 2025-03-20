class Order {
  String orderSheet;

  Order(this.orderSheet);

  List<List<String>> getOrderList() {
    return orderSheet
        .split(";")
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .map((e) {
      List<String> specificOrder = e.split(",");
      if (specificOrder.length != 3) {
        throw FormatException("Invalid order format: $e");
      }
      return specificOrder;
    }).toList();
  }

  Map<String, int> getProductPriceMap() {
    Map<String, int> productPrice = {};

    for (var specificOrder in getOrderList()) {
      String product = specificOrder[0];
      int price = int.tryParse(specificOrder[1]) ?? 0;
      int quantity = int.tryParse(specificOrder[2]) ?? 0;
      int increment = price * quantity;
      productPrice.putIfAbsent(product, () => 0);
      productPrice[product] = productPrice[product]! + increment;
    }

    return productPrice;
  }

  Set<String> getProductOrderList() {
    return getOrderList().map((e) => e[0]).toSet();
  }

  int getProductOrderCount() => getOrderList().length;

  int getPriceEachProduct(String name) => getProductPriceMap()[name] ?? 0;

  int getTotalPriceOfProducts() => getProductPriceMap().sumValues();
}

extension SumExtension on Map<String, int> {
  int sumValues() => values.fold(0, (prev, value) => prev + value);
}

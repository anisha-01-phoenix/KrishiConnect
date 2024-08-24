class Bidder {
  final String name;
  final String region;
  final double quantity;
  final String quantity_unit;
  final double pricePerUnit;

  Bidder({
    required this.name,
    required this.region,
    required this.quantity,
    required this.quantity_unit,
    required this.pricePerUnit,
  });
}

class Bid {
  final String productName;
  final double mspPrice;
  final double bidPrice;
  final String farmerName;
  final String status; // "accepted" or "rejected"

  Bid({
    required this.productName,
    required this.mspPrice,
    required this.bidPrice,
    required this.farmerName,
    required this.status,
  });
}

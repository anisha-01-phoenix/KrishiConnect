import 'bidder.dart';

class Order {
  final String productName;
  final double mspPrice;
  final String imageUrl;
  final List<Bidder> bidders;
  int? selectedBidderIndex;

  Order({
    required this.productName,
    required this.mspPrice,
    required this.imageUrl,
    required this.bidders,
    this.selectedBidderIndex,
  });
}

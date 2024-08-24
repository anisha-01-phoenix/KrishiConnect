import 'package:flutter/material.dart';
import '../constants/quality.dart';
import '../constants/status.dart';
import '../model/product.dart';

class ProductBuyerListItem extends StatelessWidget {
  final List<Product> products;

  ProductBuyerListItem({required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Card(
          margin: EdgeInsets.all(8.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    product.imageUrl,
                    height: 150.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.redAccent),
                        SizedBox(width: 4.0),
                        Text(product.region),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '${product.quantity} ${product.quantity_unit}',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 4.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'MSP: ₹${product.msp.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: Colors.orange.shade700,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Estmated Price: ₹${product.estimatedPrice.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: Colors.orange.shade700,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${product.status}',
                      style: TextStyle(
                        color: getStatusColor(product.status),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Chip(
                      label: Text(product.category),
                      backgroundColor: Colors.green.shade100,
                    ),
                    Row(
                      children: buildQualityStars(product.quality),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Place Bid button functionality
                        _placeBid(context, product);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        side: BorderSide(
                          color: Colors.green, // Border color
                          width: 2.0, // Border width
                        ),
                      ),
                      child: Text('Place Bid'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Add to Cart button functionality
                        _addToCart(context, product);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text('Add to Cart'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _placeBid(BuildContext context, Product product) {
    final TextEditingController _priceController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Place Your Bid'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Enter a bid amount between ₹${product.estimatedPrice.toStringAsFixed(2)} and ₹${product.msp.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _priceController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: 'Bid Amount',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final double bidAmount =
                    double.tryParse(_priceController.text) ?? 0.0;

                if (bidAmount >= product.estimatedPrice &&
                    bidAmount <= product.msp) {
                  Navigator.of(context).pop();
                  // Handle bid placement logic here
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Bid of ₹${bidAmount.toStringAsFixed(2)} placed successfully!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Bid amount must be between ₹${product.estimatedPrice.toStringAsFixed(2)} and ₹${product.msp.toStringAsFixed(2)}'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: Text(
                'Place Bid',
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _addToCart(BuildContext context, Product product) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} added to cart!'),
        backgroundColor: Colors.green,
      ),
    );
  }
}

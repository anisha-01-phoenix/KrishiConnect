import 'package:flutter/material.dart';
import '../constants/quality.dart';
import '../constants/status.dart';
import '../model/product.dart';
import 'edit_product_bottom_sheet.dart';

class ProductFarmerListItem extends StatelessWidget {
  final List<Product> products;

  ProductFarmerListItem({required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Card(
          margin: EdgeInsets.all(8.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
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
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.black),
                      onPressed: () {
                        _showEditBottomSheet(context, product);
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.redAccent),
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
                    Text(
                      'MSP: ₹${product.estimatedPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.orange.shade700,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
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
                    Row(
                      children: [
                        Chip(
                          label: Text(product.category),
                          backgroundColor: Colors.green.shade100,
                        ),
                      ],
                    ),
                    Row(
                      children: buildQualityStars(product.quality),
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

  // Show edit bottom sheet
  void _showEditBottomSheet(BuildContext context, Product product) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return EditProductBottomSheet(product: product);
      },
    );
  }
}




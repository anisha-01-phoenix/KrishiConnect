import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../model/product.dart';
import '../../widgets/search.dart';

class CartPageBuyer extends StatefulWidget {
  @override
  _CartPageBuyerState createState() => _CartPageBuyerState();
}

class _CartPageBuyerState extends State<CartPageBuyer> {
  Map<int, bool> selectedProducts = {};

  final List<Product> cartProducts = [
    Product(
      name: 'Wheat',
      category: 'Grains',
      imageUrl: 'assets/images/wheat.png',
      estimatedPrice: 1500.00,
      msp: 2000.0,
      quantity: 10,
      quantity_unit: 'kg',
      farmerName: 'Farmer A',
      region: 'Punjab',
      quality: 'A',
      status: 'Verified',
      storageOption: 'self',
    ),
    Product(
      name: 'Rice',
      quality: 'B',
      category: 'Grains',
      imageUrl: 'assets/images/rice.png',
      estimatedPrice: 2000.00,
      msp: 2500.00,
      quantity: 5,
      quantity_unit: 'kg',
      farmerName: 'Farmer B',
      region: 'Haryana',
      status: 'Verified',
      storageOption: 'self',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchWidget(),
          Expanded(
            child: ListView.builder(
              itemCount: cartProducts.length,
              itemBuilder: (context, index) {
                final product = cartProducts[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  elevation: 4.0,
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
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Text(
                              product.name,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                            ),
                            Spacer(),
                            Checkbox(
                              checkColor: Colors.white,
                              activeColor: Colors.green,
                              value: selectedProducts[index] ?? false,
                              onChanged: (bool? value) {
                                setState(() {
                                  selectedProducts[index] = value ?? false;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          children: [
                            Text(product.farmerName, style: TextStyle(fontWeight: FontWeight.bold)),
                            Spacer(),
                            Icon(Icons.location_on, color: Colors.redAccent),
                            Text(product.region),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                        child: Row(
                          children: [
                            Text('${product.quantity} ${product.quantity_unit}', style: TextStyle(fontSize: 16.0)),
                            Spacer(),
                            Text('₹${product.estimatedPrice.toStringAsFixed(2)}', style: TextStyle(color: Colors.orange, fontSize: 16.0)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Category: ${product.category}', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/checkout');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green, // Background color
              padding: EdgeInsets.symmetric(vertical: 16.0),
              textStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Proceed to Buy', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

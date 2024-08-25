import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:krishi_connect/screens/product_buyer.dart';
import '../../constants/mandi.dart';
import '../../model/product.dart';

class HomePageBuyer extends StatefulWidget {
  @override
  _HomePageBuyerState createState() => _HomePageBuyerState();
}

class _HomePageBuyerState extends State<HomePageBuyer> {
  String? selectedRegion;
  String? selectedMandi;

  List<Product> allProducts = [
    Product(
      name: 'Wheat',
      category: 'Grains',
      region: 'Punjab',
      quality: 'A+',
      quantity: 1000,
      status: 'Verified',
      estimatedPrice: 1500.00,
      msp: 2100.00,
      storageOption: 'Cold Storage',
      quantity_unit: 'kg',
      imageUrl: 'assets/images/wheat.png',
      farmerName: 'Aditya',
    ),
    Product(
      name: 'Rice',
      category: 'Grains',
      region: 'Haryana',
      quality: 'A',
      quantity: 500,
      msp: 1000,
      status: 'Verified',
      estimatedPrice: 2000.00,
      storageOption: 'Warehouse',
      quantity_unit: 'kg',
      imageUrl: 'assets/images/rice.png',
      farmerName: 'Tarun',
    ),
  ];

  List<Product> get filteredProducts {
    // Filter products based on the selected mandi
    if (selectedMandi == null || selectedRegion == null) {
      return [];
    } else {
      return allProducts
          .where((product) => product.region == selectedRegion)
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Region: ', style: TextStyle(fontSize: 16)),
                SizedBox(width: 8),
                Expanded(
                  child: DropdownButton<String>(
                    hint: Text('Select Region'),
                    value: selectedRegion,
                    items: mandis.keys
                        .map((String region) {
                          return DropdownMenuItem<String>(
                            value: region,
                            child: Text(region),
                          );
                        })
                        .toSet()
                        .toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedRegion = newValue;
                        selectedMandi = null; // Reset mandi selection
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Mandi: ', style: TextStyle(fontSize: 16)),
                SizedBox(width: 8),
                Expanded(
                  child: DropdownButton<String>(
                    hint: Text('Select Mandi'),
                    value: selectedMandi,
                    items: selectedRegion == null
                        ? []
                        : mandis[selectedRegion]!
                            .map((String mandi) {
                              return DropdownMenuItem<String>(
                                value: mandi,
                                child: Text(mandi),
                              );
                            })
                            .toSet()
                            .toList(),
                    // Ensure unique values by converting to Set and back to List
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedMandi = newValue;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: selectedRegion == null
                ? Center(child: Text('Please select a region to view products'))
                : filteredProducts.isEmpty
                    ? Center(
                        child: Text(
                            'No products available for the selected region'))
                    : ProductBuyerListItem(products: filteredProducts),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../constants/categories.dart';

class ProductsPageFarmer extends StatefulWidget {
  @override
  _ProductsPageFarmerState createState() => _ProductsPageFarmerState();
}

class _ProductsPageFarmerState extends State<ProductsPageFarmer> {
  final _formKey = GlobalKey<FormState>();
  String _selectedCategory = categories[0];
  String _productName = '';
  double _quantity = 0.0;
  String _quantityUnit = 'kg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Product Name',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2.0),
                  ),
                  hintText: 'Enter the product name',
                  hintStyle: TextStyle(color: Colors.grey), // Hint text color
                ),
                onSaved: (value) => _productName = value ?? '',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the product name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Text(
                'Category',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                items: categories.map((category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value ?? categories[0];
                  });
                },
                onSaved: (value) => _selectedCategory = value ?? categories[0],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a category';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Text(
                'Quantity',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green, width: 2.0),
                        ),
                        hintText: 'Quantity',
                        hintStyle: TextStyle(color: Colors.grey), // Hint text color
                      ),
                      onSaved: (value) =>
                      _quantity = double.tryParse(value ?? '0') ?? 0.0,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the quantity';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _quantityUnit,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      items: ['kg', 'liters', 'units', 'quintals'].map((unit) {
                        return DropdownMenuItem<String>(
                          value: unit,
                          child: Text(unit),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _quantityUnit = value ?? 'kg';
                        });
                      },
                      onSaved: (value) => _quantityUnit = value ?? 'kg',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.0),
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.spa_outlined),
                      SizedBox(width: 10.0),
                      Text('List Product'),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      // Simulate a progress indicator
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(
                color: Colors.green,
              ),
              SizedBox(width: 20),
              Text('Processing...'),
            ],
          ),
        ),
      );

      Future.delayed(Duration(seconds: 2), () {
        Navigator.of(context).pop(); // Close the progress dialog
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Product Listed Successfully')),
        );

        // Reset the form
        _formKey.currentState?.reset();
        setState(() {
          _selectedCategory = categories[0];
          _productName = '';
          _quantity = 0.0;
          _quantityUnit = 'kg';
        });
      });
    }
  }
}

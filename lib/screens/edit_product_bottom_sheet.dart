import 'package:flutter/material.dart';
import '../model/product.dart';

class EditProductBottomSheet extends StatefulWidget {
  final Product product;

  EditProductBottomSheet({required this.product});

  @override
  EditProductBottomSheetState createState() => EditProductBottomSheetState();
}

class EditProductBottomSheetState extends State<EditProductBottomSheet> {
  final _quantityController = TextEditingController();
  bool _isUploading = false;
  bool _isUploadComplete = false;
  bool _isSubmitting = false;
  String? _uploadedImageUrl;

  @override
  void initState() {
    super.initState();
    _quantityController.text = widget.product.quantity.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Edit Product',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'Product: ${widget.product.name}',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Category: ${widget.product.category}',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Quantity',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: _quantityController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 2.0),
                ),
                hintText: 'Enter new quantity in ${widget.product.quantity_unit}',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Upload APMC Quality Certificate',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            if (_isUploading)
              Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              )
            else if (_isUploadComplete)
              Column(
                children: [
                  _uploadedImageUrl != null
                      ? Image.network(
                          _uploadedImageUrl!,
                          height: 100,
                          width: 100,
                        )
                      : Container(),
                  SizedBox(height: 8.0),
                  Text('Image uploaded successfully!'),
                ],
              ),
            ElevatedButton.icon(
              onPressed: () {
                _handleImageUpload();
              },
              icon: Icon(Icons.upload_file),
              label: Text('Upload Certificate'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton.icon(
              onPressed: _isSubmitting ? null : () => _handleSubmit(context),
              icon: _isSubmitting
                  ? CircularProgressIndicator(
                      color: Colors.green,
                      strokeWidth: 2.0,
                    )
                  : Icon(Icons.save),
              label: Text('Edit Product'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Handle image upload
  void _handleImageUpload() async {
    setState(() {
      _isUploading = true;
    });

    // Simulate image upload
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _isUploading = false;
      _isUploadComplete = true;
      _uploadedImageUrl =
          'https://via.placeholder.com/100'; // Replace with actual URL
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Image uploaded successfully!')),
    );
  }

  // Handle form submission
  void _handleSubmit(BuildContext context) async {
    setState(() {
      _isSubmitting = true;
    });

    // Simulate form submission
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _isSubmitting = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Product edited successfully!')),
    );

    Navigator.pop(context); // Close the bottom sheet
  }
}

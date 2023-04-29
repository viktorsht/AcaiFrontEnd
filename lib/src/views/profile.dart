import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});
}

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  Product? _selectedProduct;

  final List<Product> _products = [
    Product(name: 'Product A', price: 10.0),
    Product(name: 'Product B', price: 20.0),
    Product(name: 'Product C', price: 30.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _products
          .map((product) => RadioListTile<Product>(
                title: Text('${product.name} (\$${product.price})'),
                value: product,
                groupValue: _selectedProduct,
                onChanged: (selectedProduct) {
                  setState(() {
                    _selectedProduct = selectedProduct;
                  });
                },
              ))
          .toList(),
    );
  }
}

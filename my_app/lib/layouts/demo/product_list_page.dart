import 'package:flutter/material.dart';
import 'package:my_app/layouts/demo/path_management.dart';
import 'package:my_app/layouts/demo/product.dart';

void main() {
  runApp(const ProductListPage());
}

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: _ProductList());
  }
}

class _ProductList extends StatelessWidget {
  const _ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    final products = _getAllProducts();

    return Scaffold(
      appBar: AppBar(title: Text('Product List')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: Image.asset(product.imagePath, width: 100, height: 100),
            title: Text(product.title),
            subtitle: Text('${product.description} \n${product.price}'),
            // trailing: Text('\$${product.price}'),
          );
        },
      ),
      // body: Column(
      //   spacing: 10,
      //   children: [
      //     _buildRow(
      //       PathManagement.pathIphone,
      //       'Iphone 14 Pro',
      //       'New Apple Phone',
      //       1000,
      //     ),
      //     // Row(
      //     //   children: [
      //     //     Image.asset(
      //     //       'images/products/iphone.png',
      //     //       width: 100,
      //     //       height: 100,
      //     //     ),
      //     //     Column(
      //     //       crossAxisAlignment: CrossAxisAlignment.start,
      //     //       children: [
      //     //         Text('Iphone 14 Pro'),
      //     //         Text('New Apple Phone'),
      //     //         Text('1000'),
      //     //       ],
      //     //     ),
      //     //   ],
      //     // ),
      //     _buildRow(
      //       'images/products/samsung.png',
      //       'Samsung Galaxy S21',
      //       'New Style',
      //       900,
      //     ),
      //     // Row(
      //     //   children: [
      //     //     Image.asset(
      //     //       'images/products/samsung.png',
      //     //       width: 100,
      //     //       height: 100,
      //     //     ),
      //     //     Column(
      //     //       crossAxisAlignment: CrossAxisAlignment.start,
      //     //       children: [
      //     //         Text('Samsung Galaxy S21'),
      //     //         Text('New Style'),
      //     //         Text('9000'),
      //     //       ],
      //     //     ),
      //     //   ],
      //     // ),
      //     _buildRow(
      //       'images/products/ipad.png',
      //       'App Ipad Pro',
      //       'New Version',
      //       2000,
      //     ),
      //     // Row(
      //     //   children: [
      //     //     Image.asset('images/products/ipad.png', width: 100, height: 100),
      //     //     Column(
      //     //       crossAxisAlignment: CrossAxisAlignment.start,
      //     //       children: [
      //     //         Text('App Ipad Pro'),
      //     //         Text('New Version'),
      //     //         Text('2000'),
      //     //       ],
      //     //     ),
      //     //   ],
      //     // ),
      //   ],
      // ),
    );
  }

  Row _buildRow(String imagePath, String title, String description, num price) {
    return Row(
      children: [
        Image.asset(imagePath, width: 100, height: 100),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(title), Text(description), Text('$price')],
        ),
      ],
    );
  }

  List<Product> _getAllProducts() {
    return [
      Product(
        PathManagement.pathIphone,
        'Iphone 14 Pro',
        'New Apple Phone',
        1000,
      ),
      Product(
        'images/products/samsung.png',
        'Samsung Galaxy S21',
        'New Style',
        900,
      ),
      Product('images/products/ipad.png', 'App Ipad Pro', 'New Version', 2000),
      Product(
        'images/products/macbook_air.png',
        'App Macbook Air 2025',
        'New Version',
        4000,
      ),
    ];
  }
}

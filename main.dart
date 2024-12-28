import 'package:flutter/material.dart';

void main() {
  runApp(MyJewelleryApp());
}

class MyJewelleryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Jewellery',
      theme: ThemeData(primarySwatch: Colors.pink),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/cart': (context) => CartScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> products = [
    {'name': 'Gold Ring', 'image': 'assets/gold_ring.jpg', 'price': '₹5000'},
    {'name': 'Silver Necklace', 'image': 'assets/silver_necklace.jpg', 'price': '₹12000'},
    {'name': 'Diamond Earrings', 'image': 'assets/diamond_earrings.jpg', 'price': '₹25000'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Jewellery'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Image.asset(products[index]['image']!),
              title: Text(products[index]['name']!),
              subtitle: Text(products[index]['price']!),
              trailing: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  // Add to cart logic
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${products[index]['name']} added to cart!')),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Center(
        child: Text('Cart is empty.'),
      ),
    );
  }
}

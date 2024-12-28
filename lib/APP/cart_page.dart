import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;
  final Function(String) removeFromCart;

  CartPage({required this.cartItems, required this.removeFromCart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(cartItems[index]['image']!),
                  title: Text(cartItems[index]['title']!),
                  subtitle: Text(
                      '${cartItems[index]['price']} x ${cartItems[index]['quantity']}'),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle),
                    onPressed: () {
                      removeFromCart(cartItems[index]['title']!);
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                // Handle proceed to pay logic
              },
              icon: Icon(Icons.payment),
              label: Text('Proceed to Pay'),
              style: ElevatedButton.styleFrom(
                // primary: Colors.pinkAccent,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ProductListingPage extends StatefulWidget {
  const ProductListingPage({super.key});

  @override
  _ProductListingPageState createState() => _ProductListingPageState();
}

class _ProductListingPageState extends State<ProductListingPage> {
  int _selectedIndex = 1; // Set default to "Categories"

  void _onItemTapped(int index) {
    if (index == 0) {
      // Navigate to MainPage for Home
      Navigator.pushNamed(context, '/');
    } else if (index == 2) {
      // Placeholder for Cart (Implement routing as needed)
    } else if (index == 3) {
      // Placeholder for Profile (Implement routing as needed)
    }
  }

  @override
  Widget build(BuildContext context) {
    // Sample list of products
    List<String> products = [
      "Gold Necklace",
      "Diamond Ring",
      "Silver Bracelet",
      "Platinum Earrings",
      "Pearl Pendant",
      "Ruby Brooch",
      "Sapphire Anklet",
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime,
        title: const Text(
          'Product Listing',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                2, // You can change this to adjust the number of columns
            crossAxisSpacing: 3.0,
            mainAxisSpacing: 3.0,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Handle product selection
                print("Tapped on ${products[index]}");
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 4.0,
                      offset: const Offset(0, 2), // Shadow position
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    products[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pink,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.redAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}

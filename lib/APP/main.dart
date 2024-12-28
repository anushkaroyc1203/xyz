import 'package:flutter/material.dart';
import 'cart_page.dart';
import 'sign_up_page.dart';
import 'login_page.dart';
import 'all_products.dart'; // Import the All Products page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => JewelleryHomePage(),
        '/cart': (context) => CartPage(
              cartItems: (ModalRoute.of(context)?.settings.arguments
                  as Map)['cartItems'],
              removeFromCart: (ModalRoute.of(context)?.settings.arguments
                  as Map)['removeFromCart'],
            ),
        '/login': (context) => LoginPage(
              cartItems: (ModalRoute.of(context)?.settings.arguments
                  as Map)['cartItems'],
              removeFromCart: (ModalRoute.of(context)?.settings.arguments
                  as Map)['removeFromCart'],
            ),
        '/signup': (context) => SignUpPage(),
        '/all_products': (context) =>
            AllProductsPage(), // Add route for All Products page
      },
    );
  }
}

class JewelleryHomePage extends StatefulWidget {
  @override
  _JewelleryHomePageState createState() => _JewelleryHomePageState();
}

class _JewelleryHomePageState extends State<JewelleryHomePage> {
  List<Map<String, dynamic>> cartItems = [];
  List<Map<String, dynamic>> products = [
    {'image': 'assets/product1.png', 'title': 'Ring', 'price': '₹980'},
    {'image': 'assets/product2.png', 'title': 'Bracelet', 'price': '₹445'},
    // Add more products here
  ];
  List<Map<String, dynamic>> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    filteredProducts = products;
  }

  void addToCart(String image, String title, String price) {
    setState(() {
      int index = cartItems.indexWhere((item) => item['title'] == title);
      if (index != -1) {
        cartItems[index]['quantity'] += 1;
      } else {
        cartItems.add(
            {'image': image, 'title': title, 'price': price, 'quantity': 1});
      }
    });
  }

  void removeFromCart(String title) {
    setState(() {
      int index = cartItems.indexWhere((item) => item['title'] == title);
      if (index != -1) {
        cartItems.removeAt(index);
      }
    });
  }

  void filterProducts(String query) {
    setState(() {
      filteredProducts = products.where((product) {
        return product['title']!.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jewellery Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/cart', arguments: {
                'cartItems': cartItems,
                'removeFromCart': removeFromCart,
              });
            },
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/all_products');
            },
            child: Text(
              "All Products",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Navbar with Search
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFFFF1F0), // Light pink
                    Color(0xFFE6E6FA), // Lavender
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.menu, size: 28, color: Colors.black),
                      Text(
                        "Luriana24",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        children: [
                          Stack(
                            children: [
                              IconButton(
                                icon: Icon(Icons.shopping_cart,
                                    size: 28, color: Colors.black),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/cart',
                                      arguments: {
                                        'cartItems': cartItems,
                                        'removeFromCart': removeFromCart,
                                      });
                                },
                              ),
                              if (cartItems.isNotEmpty)
                                Positioned(
                                  right: 0,
                                  child: Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Text(
                                      '${cartItems.length}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(width: 16),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login',
                                  arguments: {
                                    'cartItems': cartItems,
                                    'removeFromCart': removeFromCart,
                                  });
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/signup');
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  TextField(
                    onChanged: filterProducts,
                    decoration: InputDecoration(
                      hintText: "Search your wish here!",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            // Hero Section
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Image.asset(
                    'assets/jewellery.png',
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    "Welcome to Your Last Destination for Jewellery",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Fulfill Your Wish Here",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text("SHOP NOW"),
                  ),
                ],
              ),
            ),
            // Top Categories
            Padding(
              padding: EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Top Categories",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Container(
              height: 150, // Increase the height to make the icons larger
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    width: 140, // Increase the width to make the icons larger
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.category,
                        color: Colors.white,
                        size: 50, // Increase the size of the icon
                      ),
                    ),
                  );
                },
              ),
            ),
            // Bestselling Products Section
            Padding(
              padding: EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Bestselling Products",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.5, // Adjust the aspect ratio to reduce size
              ),
              itemCount: filteredProducts.length, // Use filtered products
              itemBuilder: (context, index) {
                return ProductCard(
                  image: filteredProducts[index]['image']!,
                  title: filteredProducts[index]['title']!,
                  price: filteredProducts[index]['price']!,
                  addToCart: addToCart,
                  removeFromCart: removeFromCart,
                );
              },
            ),
            // Footer Navigation
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.pink[100],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Jewelry Bazar me jab tum pehli baar jewelry dekho, toh samajh lo, yeh ishq wala love hai!",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Quick Links",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child:
                            Text("Home", style: TextStyle(color: Colors.black)),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text("Contact Us",
                            style: TextStyle(color: Colors.black)),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text("About Us",
                            style: TextStyle(color: Colors.black)),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text("Follow Us",
                            style: TextStyle(color: Colors.black)),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: Text(
                      "© 2024 Luriana. All rights reserved.",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final Function(String, String, String) addToCart;
  final Function(String) removeFromCart;

  ProductCard({
    required this.image,
    required this.title,
    required this.price,
    required this.addToCart,
    required this.removeFromCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              image,
              height: 80, // Further reduce the height of the image
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              price,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    removeFromCart(title);
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    addToCart(image, title, price);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text("Add to Cart"),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    addToCart(image, title, price);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'pulsa.dart'; // Import the PulsaPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopee Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const ShopeeHomePage(),
    );
  }
}

class ShopeeHomePage extends StatelessWidget {
  const ShopeeHomePage({super.key});

  // Function to navigate to PulsaPage
  void _navigateToPulsaPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PulsaPage()), // Navigate to PulsaPage
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopee"),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Banner Carousel
            ImageSlideshow(
              width: double.infinity,
              height: 200,
              initialPage: 0,
              indicatorColor: Colors.orange,
              indicatorBackgroundColor: Colors.grey,
              // ignore: sort_child_properties_last
              children: [
                Image.asset(
                  'assets/images/a.jpg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/b.jpg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/c.jpg',
                  fit: BoxFit.cover,
                ),
              ],
              autoPlayInterval: 3000,
              isLoop: true,
            ),
            const SizedBox(height: 16),

            // Grid Menu Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const MenuItem(icon: Icons.account_balance_wallet, label: "Top Up & Bills"),
                  const MenuItem(icon: Icons.shopping_bag, label: "Shopee Mall"),
                  const MenuItem(icon: Icons.flash_on, label: "Flash Sale"),
                  const MenuItem(icon: Icons.local_offer, label: "Deals"),
                  GestureDetector(
                    onTap: () => _navigateToPulsaPage(context),
                    child: const MenuItem(icon: Icons.smartphone, label: "Pulsa"),
                  ),
                  const MenuItem(icon: Icons.local_shipping, label: "Free Shipping"),
                  const MenuItem(icon: Icons.shopping_cart, label: "Shopee Mart"),
                  const MenuItem(icon: Icons.account_balance, label: "Bank Transfer"),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Promo Section
            Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Special Promo",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  PromoCard(imageUrl: 'https://via.placeholder.com/150x100', title: 'Promo 1'),
                  PromoCard(imageUrl: 'https://via.placeholder.com/150x100', title: 'Promo 2'),
                  PromoCard(imageUrl: 'https://via.placeholder.com/150x100', title: 'Promo 3'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.flash_on), label: 'Deals'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const MenuItem({Key? key, required this.icon, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 40, color: Colors.orange),
        const SizedBox(height: 8),
        Text(label, textAlign: TextAlign.center),
      ],
    );
  }
}

class PromoCard extends StatelessWidget {
  final String imageUrl;
  final String title;

  const PromoCard({Key? key, required this.imageUrl, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Image.network(
            imageUrl,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

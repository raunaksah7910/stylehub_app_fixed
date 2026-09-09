import 'package:flutter/material.dart';

void main() {
  runApp(const StyleHubApp());
}

const purple = Color(0xFF8B5CF6);
const lightPurple = Color(0xFFEDE9FE);
const background = Color(0xFFF9FAFB);
const darkText = Color(0xFF1F2937);

class Product {
  final String name;
  final double price;
  final String image;

  const Product({
    required this.name,
    required this.price,
    required this.image,
  });
}

const products = [
  Product(
    name: 'Elegant Lavender Dress',
    price: 89.99,
    image: 'assets/images/Image (Dresses).png',
  ),
  Product(
    name: 'Classic White Top',
    price: 49.99,
    image: 'assets/images/Image (Tops).png',
  ),
  Product(
    name: 'Wool Overcoat',
    price: 385.00,
    image: 'assets/images/Image (Jackets).png',
  ),
  Product(
    name: 'Fashion Accessories',
    price: 69.99,
    image: 'assets/images/Image (Accessories).png',
  ),
];

class StyleHubApp extends StatelessWidget {
  const StyleHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StyleHub',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: background,
        colorScheme: ColorScheme.fromSeed(seedColor: purple),
        appBarTheme: const AppBarTheme(
          backgroundColor: background,
          foregroundColor: darkText,
          elevation: 0,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
          ),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}

void openPage(BuildContext context, Widget page) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => page),
  );
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 330,
                    child: Image.asset(
                      'assets/images/Image (StyleHub fashion).png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: 330,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Color(0xFFF9FAFB),
                        ],
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 26,
                    top: 35,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'StyleHub',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(color: Colors.black54, blurRadius: 8),
                            ],
                          ),
                        ),
                        Text(
                          'Fashion for a brighter you',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            shadows: [
                              Shadow(color: Colors.black54, blurRadius: 8),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                child: Column(
                  children: [
                    const Text(
                      'Welcome to StyleHub',
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: darkText,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Sign in to discover your style',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 25),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Email address',
                        hintText: 'raunak@example.com',
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        prefixIcon: Icon(Icons.lock_outline),
                        suffixIcon: Icon(Icons.visibility_outlined),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(color: purple),
                      ),
                    ),
                    const SizedBox(height: 20),
                    PrimaryButton(
                      text: 'SIGN IN',
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const HomeScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 22),
                    const Text("Don't have an account?  Sign up"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, Raunak',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Good style. Brighter days.',
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundColor: lightPurple,
              child: Icon(Icons.person, color: purple),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: 'Search for dresses, bags, shoes...',
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 18),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/Image (New Season).png',
                    width: double.infinity,
                    height: 205,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 205,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      colors: [Colors.black87, Colors.transparent],
                    ),
                  ),
                ),
                Positioned(
                  left: 22,
                  top: 25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'FRESH LOOKS',
                        style: TextStyle(color: Colors.white70),
                      ),
                      const Text(
                        'New Season',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 31,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Discover timeless styles\nfor every moment.',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 15),
                      FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: darkText,
                        ),
                        onPressed: () {
                          openPage(
                            context,
                            const ProductListScreen(),
                          );
                        },
                        child: const Text('Shop Now'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SectionHeader(
              title: 'Shop by Category',
              onTap: () {
                openPage(context, const CategoriesScreen());
              },
            ),
            const SizedBox(height: 12),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategorySmall(
                  name: 'Dresses',
                  image: 'assets/images/Image (Dresses).png',
                ),
                CategorySmall(
                  name: 'Tops',
                  image: 'assets/images/Image (Tops).png',
                ),
                CategorySmall(
                  name: 'Shoes',
                  image: 'assets/images/Image (Shoes).png',
                ),
                CategorySmall(
                  name: 'Bags',
                  image: 'assets/images/Image (Bags).png',
                ),
              ],
            ),
            const SizedBox(height: 26),
            SectionHeader(
              title: 'Featured for You',
              onTap: () {
                openPage(context, const ProductListScreen());
              },
            ),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.72,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                return ProductCard(product: products[index]);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppNavigationBar(selectedIndex: 0),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SectionHeader({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: onTap,
          child: const Text('See All'),
        ),
      ],
    );
  }
}

class CategorySmall extends StatelessWidget {
  final String name;
  final String image;

  const CategorySmall({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        openPage(context, const ProductListScreen());
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              image,
              width: 72,
              height: 72,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 6),
          Text(name, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  static const categories = [
    ['Dresses', 'assets/images/Image (Dresses).png'],
    ['Tops', 'assets/images/Image (Tops).png'],
    ['Shoes', 'assets/images/Image (Shoes).png'],
    ['Bags', 'assets/images/Image (Bags).png'],
    ['Accessories', 'assets/images/Image (Accessories).png'],
    ['Jackets', 'assets/images/Image (Jackets).png'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Categories',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.85,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              openPage(context, const ProductListScreen());
            },
            child: Card(
              color: Colors.white,
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.asset(
                      categories[index][1],
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      categories[index][0],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const AppNavigationBar(selectedIndex: 1),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dresses',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.tune),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: 'Search dresses...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 15),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('4 products'),
                Text('Sort by: Featured'),
              ],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.70,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(product: products[index]);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppNavigationBar(selectedIndex: 1),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        openPage(
          context,
          ProductDetailsScreen(product: product),
        );
      },
      child: Card(
        color: Colors.white,
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    product.image,
                    fit: BoxFit.cover,
                  ),
                  const Positioned(
                    right: 8,
                    top: 8,
                    child: CircleAvatar(
                      radius: 17,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.favorite_border,
                        size: 19,
                        color: darkText,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 2),
              child: Text(
                product.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetailsScreen extends StatefulWidget {
  final Product product;

  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsScreen> createState() =>
      _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  String selectedSize = 'M';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text('Product Details'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(16),
            child: Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                widget.product.image,
                height: 340,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.product.name,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              '\$${widget.product.price.toStringAsFixed(2)}',
              style: const TextStyle(
                color: purple,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'A stylish and comfortable fashion item designed for every '
              'occasion.',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              'Select Size',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: ['S', 'M', 'L', 'XL'].map((size) {
                final selected = selectedSize == size;

                return ChoiceChip(
                  label: Text(size),
                  selected: selected,
                  selectedColor: purple,
                  labelStyle: TextStyle(
                    color: selected ? Colors.white : darkText,
                  ),
                  onSelected: (_) {
                    setState(() {
                      selectedSize = size;
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 28),
            PrimaryButton(
              text: 'ADD TO CART',
              icon: Icons.shopping_cart_outlined,
              onPressed: () {
                openPage(
                  context,
                  CartScreen(product: widget.product),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CartScreen extends StatefulWidget {
  final Product? product;

  const CartScreen({
    super.key,
    this.product,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int quantity = 1;

  Product get cartProduct => widget.product ?? products.first;

  @override
  Widget build(BuildContext context) {
    final total = cartProduct.price * quantity;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shopping Cart',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        cartProduct.image,
                        width: 95,
                        height: 115,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cartProduct.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('Size: M'),
                          Text(
                            '\$${cartProduct.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              color: purple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: quantity > 1
                                    ? () {
                                        setState(() {
                                          quantity--;
                                        });
                                      }
                                    : null,
                                icon: const Icon(
                                  Icons.remove_circle_outline,
                                ),
                              ),
                              Text('$quantity'),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    quantity++;
                                  });
                                },
                                icon: const Icon(
                                  Icons.add_circle_outline,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            SummaryRow(
              title: 'Subtotal',
              amount: '\$${total.toStringAsFixed(2)}',
            ),
            const SummaryRow(
              title: 'Delivery fee',
              amount: '\$0.00',
            ),
            const Divider(),
            SummaryRow(
              title: 'Total',
              amount: '\$${total.toStringAsFixed(2)}',
              bold: true,
            ),
            const SizedBox(height: 18),
            PrimaryButton(
              text: 'CHECKOUT',
              onPressed: () {
                openPage(
                  context,
                  CheckoutScreen(total: total),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CheckoutScreen extends StatelessWidget {
  final double total;

  const CheckoutScreen({
    super.key,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Checkout',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle('1. Contact Information'),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Full name',
                hintText: 'Raunak Sah',
              ),
            ),
            const SizedBox(height: 12),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'raunak@example.com',
              ),
            ),
            const SizedBox(height: 24),
            const SectionTitle('2. Delivery Address'),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Street address',
                hintText: '123 Maple Street',
              ),
            ),
            const SizedBox(height: 12),
            const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Postcode',
                hintText: '2000',
              ),
            ),
            const SizedBox(height: 24),
            const SectionTitle('3. Payment Method'),
            const Card(
              color: Colors.white,
              child: ListTile(
                leading: Icon(Icons.credit_card, color: purple),
                title: Text('Credit or debit card'),
                subtitle: Text('•••• •••• •••• 4242'),
                trailing: Icon(Icons.check_circle, color: purple),
              ),
            ),
            const SizedBox(height: 20),
            SummaryRow(
              title: 'Order total',
              amount: '\$${total.toStringAsFixed(2)}',
              bold: true,
            ),
            const SizedBox(height: 24),
            PrimaryButton(
              text: 'PLACE ORDER',
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        ConfirmationScreen(total: total),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ConfirmationScreen extends StatelessWidget {
  final double total;

  const ConfirmationScreen({
    super.key,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 46,
                backgroundColor: Color(0xFF22C55E),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 52,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Thank you!',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Your order has been confirmed.',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(height: 24),
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    children: [
                      const Text('Order number'),
                      const Text(
                        '#SH728349',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Total: \$${total.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: purple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              PrimaryButton(
                text: 'CONTINUE SHOPPING',
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const HomeScreen(),
                    ),
                    (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: purple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 19),
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SummaryRow extends StatelessWidget {
  final String title;
  final String amount;
  final bool bold;

  const SummaryRow({
    super.key,
    required this.title,
    required this.amount,
    this.bold = false,
  });

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontSize: bold ? 18 : 15,
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: style),
          Text(amount, style: style),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class AppNavigationBar extends StatelessWidget {
  final int selectedIndex;

  const AppNavigationBar({
    super.key,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) {
        if (index == selectedIndex) {
          return;
        }

        if (index == 0) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (_) => const HomeScreen(),
            ),
            (route) => false,
          );
        } else if (index == 1) {
          openPage(context, const CategoriesScreen());
        } else if (index == 2) {
          openPage(context, const CartScreen());
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Profile selected'),
            ),
          );
        }
      },
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.grid_view_outlined),
          selectedIcon: Icon(Icons.grid_view),
          label: 'Categories',
        ),
        NavigationDestination(
          icon: Icon(Icons.shopping_cart_outlined),
          selectedIcon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline),
          selectedIcon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
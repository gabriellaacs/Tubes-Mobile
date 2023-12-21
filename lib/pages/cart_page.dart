import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/cakes_tile.dart';
import 'package:flutter_application_2/models/cakes.dart';
import 'package:flutter_application_2/models/cakes_shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Remove item from cart
  void removeItemFromCart(Cakes cakes) {
    Provider.of<CakesShop>(context, listen: false).removeItemFromCart(cakes);
  }

  // Pay button tapped
  void payNow() {
    // Implement your payment service logic here
    // You can open a payment gateway or show a payment dialog, for example.
    // This is where you handle the payment process.
    // For example, you could navigate to a payment screen.
    // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CakesShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              // Heading
              Text(
                'Your Cart',
                style: TextStyle(fontSize: 20),
              ),

              // List of cart items
              Expanded(
                child: ListView.builder(
                  itemCount: value.userCart.length,
                  itemBuilder: (context, index) {
                    Cakes eachCakes = value.userCart[index];

                    // Return cakes tile
                    return CakesTile(
                      cakes: eachCakes,
                      onPressed: () => removeItemFromCart(eachCakes),
                      icon: Icon(Icons.delete),
                    );
                  },
                ),
              ),

              // Pay button
              GestureDetector(
                onTap: payNow,
                child: Container(
                  padding: EdgeInsets.all(25),
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "Pay Now",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

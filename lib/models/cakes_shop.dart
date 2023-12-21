import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/cakes.dart';

class CakesShop extends ChangeNotifier {
  // Icon for the shop
  final IconData icon = Icons.shopping_cart; // Change to the desired icon

  // Cakes for sale list
  final List<Cakes> _shop = [
  Cakes(
    name: 'Black Forrest',
    price: "20.000",
    imagePath: "lib/foto/black-forest.png",
    discount: 4, // Provide the actual discount value here
    rating: 4.5, // Provide the actual rating value here
    totalPenjualan: 100, // Provide the initial value for total sales here
  ),
  // Add other cake items with discount and total sales details

    Cakes(
      name: 'Strawberry Cake',
      price: "15.000",
      imagePath: "lib/foto/cake.png",
      discount: 3,
      rating: 3.8, // Provide the actual rating value here
      totalPenjualan: 0,
    ),
    Cakes(
      name: 'Cupcake',
      price: "10.000",
      imagePath: "lib/foto/cupcake.png",
      discount: 2,
      rating: 4.2, // Provide the actual rating value here
      totalPenjualan: 0,
    ),
    Cakes(
      name: 'Pancake',
      price: "10.000",
      imagePath: "lib/foto/pancake.png",
      discount: 2,
      rating: 4.0, // Provide the actual rating value here
      totalPenjualan: 0,
    ),
  ];

  // User cart
  List<Cakes> _userCart = [];

  // Get cakes list
  List<Cakes> get cakesShop => _shop;

  // Get user cart
  List<Cakes> get userCart => _userCart;

  // Add item to cart
  void addItemToCart(Cakes cakes) {
    _userCart.add(cakes);
    notifyListeners();
  }

  // Remove item from cart
  void removeItemFromCart(Cakes cakes) {
    _userCart.remove(cakes);
    notifyListeners();
  }
}

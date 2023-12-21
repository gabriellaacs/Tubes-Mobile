import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/cakes_tile.dart';
import 'package:flutter_application_2/models/cakes.dart';
import 'package:flutter_application_2/models/cakes_shop.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  bool _isGrid = true;

  // Add cakes to cart
  void addTocart(Cakes cakes) {
    // Add to cart
    Provider.of<CakesShop>(context, listen: false).addItemToCart(cakes);

    // Let the user know it has been successfully added
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Successfully added to cart"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CakesShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              // Toggle between grid and list view
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(_isGrid ? "Grid View" : "List View"),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isGrid = !_isGrid;
                      });
                    },
                    child: Icon(_isGrid ? Icons.grid_view_outlined : Icons.list,)
                    ,
                  ),
                ],
              ),
              const SizedBox(height: 25),

              // List or Grid of cakes with spacing
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (_isGrid) {
                      // Determine the number of columns based on screen width
                      int crossAxisCount = constraints.maxWidth ~/ 200; // Adjust the 200 to your preferred tile width

                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          crossAxisSpacing: 8.0, // Add spacing between columns
                          mainAxisSpacing: 8.0, // Add spacing between rows
                        ),
                        itemCount: value.cakesShop.length,
                        itemBuilder: (context, index) {
                          // Get individual cakes
                          Cakes eachCakes = value.cakesShop[index];

                          // Return the tile for this cake
                          return Padding(
                            padding: EdgeInsets.all(4.0), // Add spacing around each card
                            child: CakesTile(
                              cakes: eachCakes,
                              icon: Icon(Icons.add),
                              onPressed: () => addTocart(eachCakes),
                            ),
                          );
                        },
                      );
                    } else {
                      return ListView.builder(
                        itemCount: value.cakesShop.length,
                        itemBuilder: (context, index) {
                          // Get individual cakes
                          Cakes eachCakes = value.cakesShop[index];

                          // Return the tile for this cake with padding
                          return Padding(
                            padding: EdgeInsets.only(bottom: 8.0), // Add spacing only at the bottom of each card
                            child: CakesTile(
                              cakes: eachCakes,
                              icon: Icon(Icons.add),
                              onPressed: () => addTocart(eachCakes),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

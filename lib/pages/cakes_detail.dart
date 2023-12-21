import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/cakes.dart';

class CakesDetail extends StatelessWidget {
  final Cakes cakes;

  CakesDetail({Key? key, required this.cakes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200, // Adjust the image container height
              child: Center(
                child: Image.asset(
                  cakes.imagePath.toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Name: ${cakes.name}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "Price: ${cakes.price}",
              style: TextStyle(fontSize: 16, color: Colors.green),
            ),
            Text(
              "Discount: ${cakes.discount}%",
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 20),
                Text(
                  "${cakes.rating}", // Display rating
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.shopping_cart, color: Colors.blue, size: 20),
                Text(
                  "Total Penjualan: ${cakes.totalPenjualan}", // Display total sales
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              "Description:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "Add your product description here.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add your payment logic here
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Payment Successful"),
                    content: Text("Thank you for your purchase!"),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("OK"),
                      ),
                    ],
                  ),
                );
              },
              child: Text("Pay"),
            ),
          ],
        ),
      ),
    );
  }
}

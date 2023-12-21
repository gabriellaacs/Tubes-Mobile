import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/cakes.dart';
import 'package:flutter_application_2/pages/cakes_detail.dart';

class CakesTile extends StatelessWidget {
  final Cakes cakes;
  final void Function()? onPressed;
  final Widget icon;

  CakesTile({
    Key? key,
    required this.cakes,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CakesDetail(cakes: cakes),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 182, 180, 177),
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 69, // Set the height for the image container
              child: Center(
                child: Image.asset(
                  cakes.imagePath.toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 7),
            Text(
              "Name: ${cakes.name}",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Text(
              "Price: ${cakes.price}",
              style: TextStyle(fontSize: 14, color: Colors.green),
            ),
            Text(
              "Discount: ${cakes.discount}%",
              style: TextStyle(fontSize: 14, color: Colors.red),
            ),
            Row(
            children: [
              Icon(Icons.star, color: Colors.amber, size: 14),
              Text(
                "${cakes.rating}", // Display rating
                style: TextStyle(fontSize: 12),
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
          ],
        ),
      ),
    );
  }
}

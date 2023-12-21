
import 'package:flutter/material.dart';
import 'package:flutter_application_2/firebase_options.dart';
import 'package:flutter_application_2/models/cakes_shop.dart';
import 'package:provider/provider.dart';
import 'pages/intro_page.dart';
import 'package:firebase_core/firebase_core.dart';

// import 'pages/home_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CakesShop(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner:  false,
        home: IntroPage(),
      ),
    );
  }
}

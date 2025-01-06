import 'package:cars/list_cars.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Car Transactions',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ListCars(),
    );
  }
}
// hassan hussein 12132049 
//bachir saad 12133529

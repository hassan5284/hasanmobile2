import 'package:cars/calculator.dart';
import 'package:cars/report.dart';
import 'package:flutter/material.dart';
import 'car.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListCars extends StatefulWidget {
  const ListCars({Key? key}) : super(key: key);

  @override
  State<ListCars> createState() => _ListCarsState();
}

class _ListCarsState extends State<ListCars> {
  Future<List<Car>> fetchCars() async {
    final response = await http.get(Uri.parse('https://12110712.000webhostapp.com/get_transacts.php'));
    if (response.statusCode == 200) {
      List<dynamic> carsJson = json.decode(response.body);
      return carsJson.map((json) => Car.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load cars');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Cars'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Report(),
                ),
              );
            },
            icon: const Icon(Icons.list_alt_outlined),
          )
        ],
      ),
      body: FutureBuilder<List<Car>>(
        future: fetchCars(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Car car = snapshot.data![index];
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Calculator(car: car),
                      ),
                    );
                  },
                  child: Card(
                    child: Row(children: [
                      Image.network(car.image,
                          width: 150, height: 100, fit: BoxFit.fill),
                      const SizedBox(width: 30),
                      Text(car.model, style: const TextStyle(fontSize: 18))
                    ]),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('No cars found'));
          }
        },
      ),
    );
  }
}

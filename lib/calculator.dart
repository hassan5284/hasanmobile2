import 'package:cars/car.dart';
import 'package:cars/transact.dart';
import 'package:flutter/material.dart';


class Calculator extends StatefulWidget {
  const Calculator({super.key, required this.car});

  final Car car;

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int selectedYear = 2023;

  double calculatedPrice = 0.0;
  int kms = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.car.model} Prices'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              widget.car.image,
              width: double.infinity,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Select Year'),
                SizedBox(
                  width: 100,
                  child: DropdownButton(
                    isExpanded: true,
                    onChanged: (value) {
                      setState(() {
                        selectedYear = value ?? 0;
                      });
                    },
                    value: selectedYear,
                    items: years.map((year) {
                      return DropdownMenuItem(
                        value: year,
                        child: Text('$year'),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Enter Drived KMs'),
                SizedBox(
                  width: 100,
                  child: TextField(
                    onChanged: (value) {
                      kms = int.tryParse(value) ?? 0;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => calculatePrice(),
              child: const Text('Calculate Price'),
            ),
            const SizedBox(height: 20),
            Text(
              'Total Price is $calculatedPrice \$',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => buyCar(),
              child: const Text('Buy Car'),
            ),
          ],
        ),
      ),
    );
  }

  buyCar() {
    String name = '';
    String visaCard = '';

    AlertDialog dialog = AlertDialog(
      title: const Text('Client Info'),
      content: SizedBox(
        height: 175,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Client Name'),
            TextField(
              onChanged: (value) => name = value,
              decoration: const InputDecoration(hintText: "Enter Name"),
            ),
            const SizedBox(height: 20),
            const Text('Visa Card'),
            TextField(
              onChanged: (value) => visaCard = value,
              decoration: const InputDecoration(hintText: "Enter Visa Card"),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            Transact transact = Transact(
              0, 
              widget.car.model,
              widget.car.image,
              name,
              visaCard,
              calculatedPrice,
              selectedYear,
              DateTime.now(),
            );

            Navigator.pop(context);
          },
          child: const Text('Ok'),
        )
      ],
    );

    showDialog(context: context, builder: (context) => dialog);
  }

  calculatePrice() {
    int years = selectedYear - 2010;
    double carPrice = widget.car.price + (years * 1000);

    double kmPrice = carPrice * (kms % 999) * 0.01;

    setState(() {
      calculatedPrice = carPrice - kmPrice;
    });
  }
}

import 'package:cars/transact.dart';
import 'package:flutter/material.dart';

class ReportItem extends StatelessWidget {
  const ReportItem({super.key, required this.transact});

  final Transact transact;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(children: [
        Image.network(transact.image,
            width: 150, height: 100, fit: BoxFit.fill),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${transact.model} ${transact.year}',
                style: const TextStyle(fontSize: 18)),
            Text(
                '${transact.price} \$  ${transact.date.day}/${transact.date.month}/${transact.date.year}',
                style: const TextStyle(fontSize: 16)),
            Text(transact.clientName, style: const TextStyle(fontSize: 16)),
            Text(transact.visaCard, style: const TextStyle(fontSize: 16)),
          ],
        )
      ]),
    );
  }
}

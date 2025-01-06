import 'package:cars/report_item.dart';
import 'package:cars/transact.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  Future<List<Transact>> fetchTransacts() async {
    final response = await http.get(Uri.parse('https://12110712.000webhostapp.com/get_transacts.php'));
    if (response.statusCode == 200) {
      List<dynamic> transactsJson = json.decode(response.body);
      return transactsJson.map((json) => Transact.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load transactions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Report')),
      body: FutureBuilder<List<Transact>>(
        future: fetchTransacts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ReportItem(transact: snapshot.data![index]);
              },
              itemCount: snapshot.data!.length,
            );
          } else {
            return const Center(child: Text('No transactions found'));
          }
        },
      ),
    );
  }
}

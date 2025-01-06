import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cars/transact.dart';

class CarsDatabase {
  static const String apiUrl = 'https://12110712.000webhostapp.com/get_transacts.php';

  static Future<List<Transact>> transacts() async {
    final response = await http.get(Uri.parse(apiUrl));
    // print('Response: ${response.body}');

    if (response.statusCode == 200) {
      List<dynamic> transactsJson = json.decode(response.body);
      return transactsJson.map((json) => Transact.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load transactions');
    }
  }
}

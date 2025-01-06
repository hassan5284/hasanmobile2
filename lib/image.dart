import 'package:flutter/material.dart';

class ShowImage extends StatelessWidget {
  const ShowImage({super.key});

  @override
  Widget build(BuildContext context) {
    String url = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(centerTitle: true),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(url, width: 600, height: 300, fit: BoxFit.fill)
          ],
        ),
      ),
    );
  }
}

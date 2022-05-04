import 'package:flutter/material.dart';

class HomeError extends StatelessWidget {
  final String error;

  const HomeError({
    Key? key,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 128.0,
              child: _mainImage(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _mainText(),
            ),
          ],
        ),
      ),
    );
  }

  Image _mainImage() {
    return const Image(
      image: AssetImage(
        'assets/unown.png',
      ),
    );
  }

  Text _mainText() {
    return Text(
      error,
      style: const TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

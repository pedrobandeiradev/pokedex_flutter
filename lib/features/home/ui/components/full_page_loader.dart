import 'package:flutter/material.dart';

class FullPageLoader extends StatelessWidget {
  final AnimationController controller;

  const FullPageLoader({
    Key? key,
    required this.controller,
  }) : super(key: key);

  void _startRotatingPokeball() {
    controller.forward();
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    _startRotatingPokeball();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0).animate(controller),
            child: _splashImage(),
          ),
        ],
      ),
    );
  }

  Image _splashImage() {
    return const Image(
      image: AssetImage(
        'assets/pokeball.png',
      ),
    );
  }
}

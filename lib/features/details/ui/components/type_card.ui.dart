import 'package:flutter/material.dart';

class TypeCard extends StatelessWidget {
  final String typeName;
  final Color baseColor;

  const TypeCard({
    Key? key,
    required this.typeName,
    required this.baseColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          8.0,
        ),
        color: Colors.grey,
      ),
      child: Center(
        child: Text(
          typeName,
          style: TextStyle(
            color: baseColor,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}

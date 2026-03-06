import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'URLs encurtadas recentementes',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );
  }
}

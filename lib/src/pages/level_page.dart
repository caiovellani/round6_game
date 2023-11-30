import 'package:flutter/material.dart';
import 'package:round_6/constants.dart';
import 'package:round_6/widgets/level_card.dart';

class LevelPage extends StatelessWidget {
  final Modo modo;

  const LevelPage({
    super.key,
    required this.modo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nível do Jogo'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 48),
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          padding: const EdgeInsets.all(24),
          children: [
            LevelCard(modo: modo, nivel: 6),
            LevelCard(modo: modo, nivel: 8),
            LevelCard(modo: modo, nivel: 12),
          ],
        ),
      ),
    );
  }
}

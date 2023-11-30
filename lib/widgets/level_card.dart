import 'package:flutter/material.dart';
import 'package:round_6/constants.dart';
import 'package:round_6/theme.dart';

class LevelCard extends StatelessWidget {
  final Modo modo;
  final int nivel;

  const LevelCard({
    super.key,
    required this.modo,
    required this.nivel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
      child: Container(
        width: 90,
        height: 90,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: modo == Modo.normal ? Colors.white : Round6Theme.color,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: modo == Modo.normal ? Colors.transparent : Round6Theme.color,
        ),
        child: Center(
          child: Text(
            nivel.toString(),
            style: const TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}

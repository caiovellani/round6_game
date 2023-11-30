import 'package:flutter/material.dart';
import 'package:round_6/constants.dart';
import 'package:round_6/theme.dart';

class CardGame extends StatefulWidget {
  final Modo modo;
  final int option;

  const CardGame({
    required this.modo,
    required this.option,
    super.key,
  });

  @override
  State<CardGame> createState() => _CardGameState();
}

class _CardGameState extends State<CardGame> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: widget.modo == Modo.normal ? Colors.white : Round6Theme.color,
          width: 2,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: widget.modo == Modo.normal
              ? const AssetImage('assets/images/card_normal.png')
              : const AssetImage('assets/images/card_round6.png'),
        ),
      ),
    );
  }
}

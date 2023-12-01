import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:round_6/constants.dart';
import 'package:round_6/controllers/game_controller.dart';
import 'package:round_6/models/game_options.dart';
import 'package:round_6/theme.dart';

class CardGame extends StatefulWidget {
  final Modo modo;
  final GameOptions gameOptions;

  const CardGame({
    required this.modo,
    required this.gameOptions,
    super.key,
  });

  @override
  State<CardGame> createState() => _CardGameState();
}

class _CardGameState extends State<CardGame>
    with SingleTickerProviderStateMixin {
  late final AnimationController animation;

  @override
  void initState() {
    animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    super.initState();
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  flipCard() {
    final game = context.read<GameController>();

    if (!animation.isAnimating &&
        !widget.gameOptions.matched &&
        !widget.gameOptions.selected &&
        !game.gameCompleted) {
      animation.forward();
      game.choose(widget.gameOptions, resetCard);
    }
  }

  resetCard() {
    animation.reverse();
  }

  AssetImage getImage(double angulo) {
    if (angulo > 0.5 * pi) {
      return AssetImage(
          'assets/images/${widget.gameOptions.option.toString()}.png');
    } else {
      return widget.modo == Modo.normal
          ? const AssetImage('assets/images/card_normal.png')
          : const AssetImage('assets/images/card_round.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, _) {
        final angulo = animation.value * pi;
        final transform = Matrix4.identity()
          ..setEntry(3, 2, 0.002)
          ..rotateY(angulo);

        return GestureDetector(
          onTap: () => flipCard(),
          child: Transform(
            transform: transform,
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: widget.modo == Modo.normal
                      ? Colors.white
                      : Round6Theme.color,
                  width: 2,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: getImage(angulo),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

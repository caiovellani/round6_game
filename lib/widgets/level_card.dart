import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:round_6/constants.dart';
import 'package:round_6/controllers/game_controller.dart';
import 'package:round_6/models/game_play.dart';
import 'package:round_6/src/pages/game_page.dart';
import 'package:round_6/theme.dart';

class LevelCard extends StatelessWidget {
  final GamePlay gamePlay;

  const LevelCard({
    super.key,
    required this.gamePlay,
  });

  startGame(BuildContext context) {
    context.read<GameController>().startGame(gamePlay: gamePlay);

    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (BuildContext context) => GamePage(gamePlay: gamePlay),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => startGame(context),
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
      child: Container(
        width: 90,
        height: 90,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color:
                gamePlay.modo == Modo.normal ? Colors.white : Round6Theme.color,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: gamePlay.modo == Modo.normal
              ? Colors.transparent
              : Round6Theme.color,
        ),
        child: Center(
          child: Text(
            gamePlay.level.toString(),
            style: const TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:round_6/constants.dart';
import 'package:round_6/controllers/game_controller.dart';
import 'package:round_6/game_settings.dart';
import 'package:round_6/models/game_options.dart';
import 'package:round_6/models/game_play.dart';
import 'package:round_6/widgets/card_game.dart';
import 'package:round_6/widgets/game_score.dart';
import 'package:round_6/widgets/result_game.dart';

class GamePage extends StatelessWidget {
  final GamePlay gamePlay;

  const GamePage({
    required this.gamePlay,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<GameController>(context);
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: GameScore(modo: gamePlay.modo)),
      body: Observer(
        builder: (_) {
          if (controller.win) {
            return const ResultGame(resultado: Resultado.aprovado);
          } else if (controller.lost) {
            return const ResultGame(resultado: Resultado.eliminado);
          } else {
            return Center(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: GameSettings.gameBoardAxisCount(gamePlay.level),
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                padding: const EdgeInsets.all(24),
                children: controller.gameCards
                    .map(
                      (GameOptions go) =>
                          CardGame(modo: gamePlay.modo, gameOptions: go),
                    )
                    .toList(),
              ),
            );
          }
        },
      ),
    );
  }
}

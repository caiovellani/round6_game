import 'package:mobx/mobx.dart';
import 'package:round_6/constants.dart';
import 'package:round_6/game_settings.dart';
import 'package:round_6/models/game_options.dart';
import 'package:round_6/models/game_play.dart';

part 'game_controller.g.dart';

class GameController = GameControllerBase with _$GameController;

abstract class GameControllerBase with Store {
  @observable
  List<GameOptions> gameCards = [];

  @observable
  int score = 0;

  @observable
  bool win = false;

  @observable
  bool lost = false;

  late GamePlay _gamePlay;
  List<GameOptions> _choice = [];
  List<Function> _choiceCallback = [];
  int _matches = 0;
  int _numPairs = 0;

  @computed
  bool get gameCompleted => (_choice.length == 2);

  startGame({required GamePlay gamePlay}) {
    _gamePlay = gamePlay;
    _matches = 0;
    _numPairs = (_gamePlay.level / 2).round();
    win = false;
    lost = false;
    _resetScore();
    _generateCards();
  }

  _resetScore() {
    _gamePlay.modo == Modo.normal ? 0 : score = _gamePlay.level;
  }

  _generateCards() {
    List<int> cardOptions = GameSettings.cardOptions.sublist(0)..shuffle();
    cardOptions = cardOptions.sublist(0, _numPairs);
    gameCards = [...cardOptions, ...cardOptions]
        .map(
          (option) =>
              GameOptions(option: option, matched: false, selected: false),
        )
        .toList();
    gameCards.shuffle();
  }

  choose(GameOptions options, Function resetCard) async {
    options.selected = true;
    _choice.add(options);
    _choiceCallback.add(resetCard);
    await _compareCards();
  }

  _compareCards() async {
    if (gameCompleted) {
      if (_choice[0].option == _choice[1].option) {
        _matches++;
        _choice[0].matched = true;
        _choice[1].matched = true;
      } else {
        await Future.delayed(
          const Duration(seconds: 1),
          () {
            for (var i in [0, 1]) {
              _choice[i].selected = false;
              _choiceCallback[i]();
            }
          },
        );
      }

      _resetGame();
      _updateScore();
      _checkGameResult();
    }
  }

  _checkGameResult() async {
    bool allMatched = _matches == _numPairs;
    if (_gamePlay.modo == Modo.normal) {
      await _checkGameResultModoNormal(allMatched);
    } else {
      await _checkGameResultModoRound6(allMatched);
    }
  }

  _checkGameResultModoNormal(bool allMatched) async {
    await Future.delayed(const Duration(seconds: 1), () => win = allMatched);
  }

  _checkGameResultModoRound6(bool allMatched) async {
    if (_endedChoices()) {
      await Future.delayed(
        const Duration(milliseconds: 400),
        () => lost = true,
      );
    }
    if (allMatched && score >= 0) {
      await Future.delayed(
        const Duration(seconds: 1),
        () => win = allMatched,
      );
    }
  }

  _endedChoices() {
    return score < _numPairs - _matches;
  }

  _resetGame() {
    _choice = [];
    _choiceCallback = [];
  }

  _updateScore() {
    _gamePlay.modo == Modo.normal ? score++ : score--;
  }

  restartGame() {
    startGame(gamePlay: _gamePlay);
  }

  nextLevel() {
    int levelIndex = 0;

    if (_gamePlay.level != GameSettings.levels.last) {
      levelIndex = GameSettings.levels.indexOf(_gamePlay.level) + 1;
    }

    _gamePlay.level = GameSettings.levels[levelIndex];
    startGame(gamePlay: _gamePlay);
  }
}

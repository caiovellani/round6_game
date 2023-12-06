import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';
import 'package:round_6/constants.dart';
import 'package:round_6/models/game_play.dart';

part 'records_repository.g.dart';

class RecordsRepository = RecordsRepositoryBase with _$RecordsRepository;

abstract class RecordsRepositoryBase with Store {
  late final Box _recordes;
  late final GamePlay gamePlay;
  @observable
  Map recordsRound6 = {};
  @observable
  Map recordsNormal = {};

  RecordsRepositoryBase() {
    _initRepository();
  }

  _initRepository() async {
    await _initDatabase();
    await loadRecordes();
  }

  _initDatabase() async {
    _recordes = await Hive.openBox('gameRecordes3');
  }

  @action
  loadRecordes() {
    recordsNormal = _recordes.get(Modo.normal.toString()) ?? {};
    recordsRound6 = _recordes.get(Modo.round6.toString()) ?? {};
  }

  updateRecords({required GamePlay gamePlay, required int score}) {
    final key = gamePlay.modo.toString();

    if (gamePlay.modo == Modo.normal &&
        (recordsNormal[gamePlay.level] == null ||
            score < recordsNormal[gamePlay.level])) {
      recordsNormal[gamePlay.level] = score;
      _recordes.put(key, recordsNormal);
    } else if (gamePlay.modo == Modo.round6 &&
        (recordsRound6[gamePlay.level] == null ||
            score > recordsRound6[gamePlay.level])) {
      recordsRound6[gamePlay.level] = score;
      _recordes.put(key, recordsRound6);
    }
  }
}

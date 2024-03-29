import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:round_6/controllers/game_controller.dart';
import 'package:round_6/repositories/records_repository.dart';
import 'package:round_6/src/pages/home_page.dart';
import 'package:round_6/theme.dart';

void main() async {
  await Hive.initFlutter();

  runApp(
    MultiProvider(
      providers: [
        Provider<RecordsRepository>(create: (_) => RecordsRepository()),
        ProxyProvider<RecordsRepository, GameController>(
          update: (_, repo, __) => GameController(
            recordsRepository: repo,
          ),
        ),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Round 6 Memory',
      debugShowCheckedModeBanner: false,
      theme: Round6Theme.theme,
      home: const HomePage(),
    );
  }
}

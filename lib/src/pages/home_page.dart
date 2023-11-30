import 'package:flutter/material.dart';
import 'package:round_6/constants.dart';
import 'package:round_6/src/pages/level_page.dart';
import 'package:round_6/theme.dart';
import 'package:round_6/widgets/goals.dart';
import 'package:round_6/widgets/logo.dart';
import 'package:round_6/widgets/start_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Logo(),
            StartButton(
              title: 'Modo Normal',
              color: Colors.white,
              action: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      const LevelPage(modo: Modo.normal),
                ),
              ),
            ),
            StartButton(
              title: 'Modo Round 6',
              color: Round6Theme.color,
              action: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      const LevelPage(modo: Modo.round6),
                ),
              ),
            ),
            const SizedBox(height: 60),
            const Goals(),
          ],
        ),
      ),
    );
  }
}

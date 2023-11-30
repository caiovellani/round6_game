import 'package:flutter/material.dart';
import 'package:round_6/constants.dart';
import 'package:round_6/src/pages/goals_page.dart';
import 'package:round_6/theme.dart';

class Goals extends StatefulWidget {
  const Goals({super.key});

  @override
  State<Goals> createState() => _GoalsState();
}

class _GoalsState extends State<Goals> {
  showGoals(Modo modo) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => GoalsPage(modo: modo),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                'Recordes',
                style: TextStyle(
                  color: Round6Theme.color,
                  fontSize: 22,
                ),
              ),
            ),
            ListTile(
              title: const Text('Modo Normal'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => showGoals(Modo.normal),
            ),
            ListTile(
              title: const Text('Modo Round 6'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => showGoals(Modo.round6),
            ),
          ],
        ),
      ),
    );
  }
}

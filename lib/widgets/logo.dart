import 'package:flutter/material.dart';
import 'package:round_6/theme.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Image.asset(
            'assets/images/host.png',
            width: 80,
            height: 125,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: RichText(
            text: TextSpan(
              text: 'Round 6',
              style: DefaultTextStyle.of(context).style.copyWith(
                    fontSize: 30,
                  ),
              children: const [
                TextSpan(
                  text: 'Memory',
                  style: TextStyle(
                    color: Round6Theme.color,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

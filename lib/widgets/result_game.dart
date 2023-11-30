import 'package:flutter/material.dart';
import 'package:round_6/constants.dart';
import 'package:round_6/widgets/start_button.dart';

class ResultGame extends StatelessWidget {
  final Resultado resultado;

  const ResultGame({
    required this.resultado,
    super.key,
  });

  String getResultado() {
    return resultado == Resultado.aprovado ? 'Aprovado' : 'Eliminado';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 60,
        horizontal: 12,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '${getResultado().toUpperCase()}!',
            style: const TextStyle(fontSize: 30),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Image.asset('images/${getResultado()}.png'),
          ),
          resultado == Resultado.eliminado
              ? StartButton(
                  title: 'Tentar Novamente',
                  color: Colors.white,
                  action: () => {},
                )
              : StartButton(
                  title: 'Próximo Nível',
                  color: Colors.white,
                  action: () => {},
                ),
        ],
      ),
    );
  }
}

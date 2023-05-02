import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  const Resultado(this.pontuacao, this.quandoReiniciarQuestionario,
      {super.key});
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;
  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Parabens';
    } else if (pontuacao < 12 && pontuacao > 7) {
      return 'Voce e bom';
    } else if (pontuacao < 16 && pontuacao > 11) {
      return 'Impressionante';
    } else {
      return 'Voce e um Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
            child: Text(
          fraseResultado,
          style: const TextStyle(fontSize: 28),
        )),
        TextButton(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty
                .all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty
                .all<Color>(Colors.blue)),
          onPressed: quandoReiniciarQuestionario,
          child: const Text('Reiniciar?'),
        )
      ],
    );
  }
}

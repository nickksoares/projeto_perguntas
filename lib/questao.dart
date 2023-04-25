import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  final String texto;
  const Questao(this.texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Text(
        texto,
        style: const TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class PerguntasClass {
  final List<Map<String, Object>> perguntasList = [
    {
      'texto': 'Qual a sua cor favorita?',
      'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco'],
    },
    {
      'texto': 'Qual e seu animal favorito?',
      'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leao'],
    },
    {
      'texto': 'Qual seu instrutor favorito?',
      'respostas': ['Maria', 'Joao', 'Leo', 'Pedro'],
    }
  ];
  
}

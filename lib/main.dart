import 'package:flutter/material.dart';
import 'package:projeto_perguntas/resultado.dart';
import 'questionario.dart';

main() {
  runApp(const PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }

    // ignore: avoid_print
    print(_pontuacaoTotal);
  }

  void _reiniciarQuestionario (){
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }



  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
       {'texto': 'Preto', 'pontuacao':  10},   
       {'texto': 'Vermelho','pontuacao':5},
       {'texto': 'Verde', 'pontuacao':  3},   
       {'texto': 'Branco','pontuacao':  1},   
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho','pontuacao': 10},
        {'texto': 'Cobra','pontuacao': 5},
        {'texto': 'Elefante','pontuacao': 3},
        {'texto': 'Leão','pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Leo','pontuacao': 10},
        {'texto': 'Maria','pontuacao': 5},
        {'texto': 'João','pontuacao': 3},
        {'texto': 'Pedro','pontuacao': 1},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Perguntas'),
          ),
          body: temPerguntaSelecionada
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntaSelecionada,
                  quandoResponder: _responder,
                )
              : Resultado(_pontuacaoTotal,_reiniciarQuestionario)),
    );
  }
}

get perguntaPos {
  return _PerguntaAppState()._perguntaSelecionada;
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}

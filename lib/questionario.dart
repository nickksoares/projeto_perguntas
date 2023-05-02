import 'dart:ffi';

import 'package:flutter/material.dart';
import 'respostas.dart';
import 'questao.dart';

class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  final void Function(int) quandoResponder;

  const Questionario(
      {super.key,
      required this.perguntas,
      required this.perguntaSelecionada,
      required this.quandoResponder});

  //failSafe para caso o index ultrapasse o numero de elementos
  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostasList = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
            as List<Map<String, Object>>
        //chave a ser passada
        : [];
/*     List<Widget> respostasWidgetList = respostasList
    .map((resp) => Resposta(resp['texto'] as String,quandoResponder))
    .toList(); */
    return Column(
        //abaixo lista de Widgets
        children: <Widget>[
          //Perguntas a serem feitas
          Questao(perguntas[perguntaSelecionada].cast()['texto']),

          //Lista de Respostas a serem respondidas
          //Utilizando o operador '...' a lista de Widget e posta
          ...respostasList.map((resp) {
            return Resposta(
              resp['texto'] as String,
              () => quandoResponder(resp['pontuacao'] as int),
            );
          }).toList()
        ]);
  }
}

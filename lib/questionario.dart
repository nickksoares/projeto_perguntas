import 'package:flutter/material.dart';
import 'respostas.dart';
import 'questao.dart';

class Questionario extends StatelessWidget {
  
    
  final int perguntaSelecionada;
  final List<Map<String,Object>> perguntas;
  final void Function() responder;

  const Questionario({
    super.key, 
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder
  });

    //failSafe para caso o index ultrapasse o numero de elementos
  bool get temPerguntaSelecionada{
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostasList = temPerguntaSelecionada
    ? perguntas[perguntaSelecionada].cast()['respostas'] //confere se nao esta out of range
     //chave a ser passada
    :[]; 
    List<Widget> respostasWidgetList = respostasList
    .map((t) => Resposta(t,responder))
    .toList();
    return  Column(
          //abaixo lista de Widgets
          children: <Widget>[
            //Perguntas a serem feitas
            Questao(perguntas[perguntaSelecionada].cast()['texto']),
            
            //Lista de Respostas a serem respondidas
            //Utilizando o operador '...' a lista de Widget e posta
            ...respostasWidgetList
          ]
    );
  }
}
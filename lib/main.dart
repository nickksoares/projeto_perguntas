import 'package:flutter/material.dart';
import 'package:projeto_perguntas/resultado.dart';
import 'questionario.dart';
import 'questao.dart';

main(){
  runApp( const PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp>{
  var _perguntaSelecionada = 0;
  
  void _responder(){
    
    if(temPerguntaSelecionada){
      setState(() {
        _perguntaSelecionada ++;
     });

    }
    
  }
  
  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }


  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco'],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão'],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': ['Maria', 'João', 'Leo', 'Pedro'],
    },
  ];

  

  @override
  Widget build(BuildContext context){
    


    return MaterialApp(
      home: Scaffold(

        appBar: AppBar(
          title: const Text('Perguntas'),
          ),
        body: temPerguntaSelecionada?
        Questionario(
          perguntas: _perguntas,
          perguntaSelecionada: _perguntaSelecionada,
          responder: _responder,
        ): const Resultado()
        
      ),
    );
  }



}

get perguntaPos {
  return _PerguntaAppState()._perguntaSelecionada;
}


class PerguntaApp extends StatefulWidget{
  const PerguntaApp({super.key});


  @override
  // ignore: library_private_types_in_public_api
  _PerguntaAppState createState(){
    return _PerguntaAppState();
  }
}


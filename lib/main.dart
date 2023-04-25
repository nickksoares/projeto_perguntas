import 'package:flutter/material.dart';
import './questao.dart';
import 'respostas.dart';

main(){
  runApp( const PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp>{
  var _perguntaSelecionada = 0;
  
  void _responder(){
    setState(() {
      _perguntaSelecionada ++;
    });
    
  }
  get perguntaPos => _perguntaSelecionada;

  @override
  Widget build(BuildContext context){
    
    List<Widget> respostasWidgetList = [];
    for (
      var textoResp 
      in 
      PerguntasClass().perguntasList[_perguntaSelecionada].cast()['respostas']
      )
      {
        respostasWidgetList.add(Resposta(textoResp, _responder));
      }

    return MaterialApp(
      home: Scaffold(

        appBar: AppBar(
          title: const Text('Perguntas'),
          ),
        body: Column(
          children: <Widget>[
            //Perguntas a serem feitas
            Questao(PerguntasClass().perguntasList[_perguntaSelecionada]['texto'].toString()),
            
            //Lista de Respostas a serem respondidas
            //Utilizando o operador '...' a lista de Widget e posta
            ...respostasWidgetList
          ],
        ),
      ),
    );
  }



}


class PerguntaApp extends StatefulWidget{
  const PerguntaApp({super.key});


  @override
  // ignore: library_private_types_in_public_api
  _PerguntaAppState createState(){
    return _PerguntaAppState();
  }
  
  
  
  

}
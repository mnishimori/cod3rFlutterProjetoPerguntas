import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;

  Questionario({
    @required this.perguntas,
    @required this.perguntaSelecionada,
    @required this.quandoResponder,
  });

  bool get temPerguntaSelecionada {
    return this.perguntaSelecionada < this.perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['resposta']
        : null;

    return Column(
      children: [
        Questao(perguntas.elementAt(perguntaSelecionada)['texto']),
        ...respostas.map((resp) => Resposta(resp['texto'], 
          () {
            quandoResponder(resp['pontuacao']);
          } ),
        ).toList(),
      ],
    );
  }
}

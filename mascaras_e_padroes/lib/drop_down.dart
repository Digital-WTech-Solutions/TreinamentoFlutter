import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';

class ListagemFixaDropDown extends StatefulWidget {
  const ListagemFixaDropDown({Key? key}) : super(key: key);

  @override
  _ListagemFixaDropDownState createState() => _ListagemFixaDropDownState();
}

class _ListagemFixaDropDownState extends State<ListagemFixaDropDown> {
  // Variáveis da classe
  late List<DropdownMenuItem<String>> _listaDropDownEstados;
  late List<DropdownMenuItem<String>> _listaDropDownDiasSemana;
  late String? estadoSelecionado;
  late String? diaSelecionado;

  @override
  void initState() {
    super.initState();
    _carregaItensDropDown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Caixa DropDown')),
      body: Row(
        children: [
          Expanded(
            child: DropdownButtonFormField(
              hint: const Text('Estados'),
              items: _listaDropDownEstados,
              validator: (valor) {
                return null;
              },
              onChanged: (valor) {
                setState(() {
                  estadoSelecionado = valor.toString();
                });
              },
            ),
          ),
          Expanded(
            child: DropdownButtonFormField(
              hint: const Text('Estados'),
              items: _listaDropDownEstados,
              validator: (valor) {
                return null;
              },
              onChanged: (valor) {
                setState(() {
                  diaSelecionado = valor.toString();
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  _carregaItensDropDown() {
    for (var estado in Estados.listaEstadosSigla) {
      _listaDropDownEstados.add(
        DropdownMenuItem(child: Text(estado), value: estado),
      );
    }
    for (var diasSemana in Semana.listaDiasSemanaAbvr) {
      _listaDropDownDiasSemana.add(
        DropdownMenuItem(child: Text(diasSemana), value: diasSemana),
      );
    }
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

// Widget principal do app
class MeuApp extends StatefulWidget {
  @override
  State<MeuApp> createState() => _MeuAppState();
}

// Classe que guarda e controla as informções da tela
class _MeuAppState extends State<MeuApp> {

  bool ligado = false;

  bool aceito = false;

  double valor = 50;

  String opcao = "A";

  void clicarIcone() {
    print("Clicou no coração");
  }

  void alterarSwitch(bool novoValor) {
    setState(() {

      ligado = novoValor;

      print(novoValor);
    });
  }

  void alterarCheckbox(bool novoValor) {

    setState(() {
      aceito = novoValor;
      print(novoValor);
    });
  }

  void alterarSlider(double novoValor) {
    
    setState(() {
      valor = novoValor;
      print(novoValor);
    });
  }

  void alterarOpcao(String novaOpcao) {

    setState(() {
      opcao = novaOpcao;
      print(novaOpcao);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Galeria de Widgets"),
        ),

        body: Padding(
          padding: EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text("IconButton"),

              IconButton(
                icon: Icon(Icons.favorite),
                onPressed: clicarIcone,
              ),

              SizedBox(height: 20),

                // ======SWITCH=======
              Text("Switch"),

              Switch(
                value: ligado,
                onChanged: (valor) {
                  alterarSwitch(valor);
                },
              ),

              SizedBox(height: 20),

              // ======CHECKBOX==========
              Text("Checkbox"),

              Checkbox(
                value: aceito, 
                onChanged: (valor) {
                  alterarCheckbox(valor!);
                },
              ),

              SizedBox(height: 20),

              // ======= SLIDER ======
              Text("Slider: ${valor.toInt()}"),

              Slider(
                min: 0,

                max: 100,

                value: valor,

                onChanged: (novoValor) {
                  alterarSlider(novoValor);
                },
              ),

              SizedBox(height: 20),

              // ===== SEGMENTED BUTTON ===========
              Text("SegmentedButton"),

              SegmentedButton<String> (
                segments: [

                  ButtonSegment(value: "A", label: Text("Opção A")),
                  ButtonSegment(value: "B", label: Text("Opção B")),
                  ButtonSegment(value: "C", label: Text("Opção C")),
                ],

                selected: {opcao},

                onSelectionChanged: (novaSelecao) {
                  alterarOpcao(novaSelecao.first);
                },
              ),            
            ],
          ),
        ),
      ),
    );
  }
}

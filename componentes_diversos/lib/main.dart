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

  bool aceito = true;

  double valor = 1;

  String opcao = "A";

  double total = 15;

  void calcularTotal() {
    double precoLanche = 0;

    if (opcao == "A") {
      precoLanche = 10;
    } else if (opcao == "B") {
      precoLanche = 15;
    } else {
      precoLanche = 20;
    }

    double adicionarQueijo = aceito ? 5 : 0;
    double taxaEntrega = ligado ? 8: 0;

    total = (precoLanche + adicionarQueijo) * valor + taxaEntrega;
  }

  // void clicarIcone() {
  //   print("Clicou no coração");
  // }===ICONE DO CORAÇÃO===

  void alterarSwitch(bool novoValor) {
    setState(() {
      ligado = novoValor;
      calcularTotal();

      print(novoValor);
    });
  }

  void alterarCheckbox(bool novoValor) {

    setState(() {
      aceito = novoValor;
      calcularTotal();

      print(novoValor);
    });
  }

  void alterarSlider(double novoValor) {
    
    setState(() {
      valor = novoValor;
      calcularTotal();

      print(novoValor);
    });
  }

  void alterarOpcao(String novaOpcao) {

    setState(() {
      opcao = novaOpcao;
      calcularTotal();

      print(novaOpcao);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Lanchonete"),
          centerTitle: true,
        ),

        body: Padding(
          padding: EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text("Escolha o lanche"),

              SegmentedButton<String>(
                segments: [
                  ButtonSegment(
                    value: "A",
                    label: Text("X-Burger (R\$10)"),
                  ),
                  ButtonSegment(
                    value: "B",
                    label: Text("X-Salada (R\$15)"),
                  ),
                  ButtonSegment(
                    value: "C",
                    label: Text("X-Tudo (R\$20)"),
                  ),
                ],

                selected: {opcao},

                onSelectionChanged: (novaSelecao) {
                  alterarOpcao(novaSelecao.first);
                },
              ),

            

              SizedBox(height: 20),

              // ======CHECKBOX==========
              Text("Adicionar Queijo (+ R\$5)"),

              Checkbox(
                value: aceito, 
                onChanged: (valor) {
                  alterarCheckbox(valor!);
                },
              ),

              SizedBox(height: 20),

                  // ======SWITCH=======
              Text("Entrega (+ R\$8)"),

              Switch(
                value: ligado,
                onChanged: (valor) {
                  alterarSwitch(valor);
                },
              ),

              SizedBox(height: 20),

              // ======= SLIDER ======
              Text("Quantidade: ${valor.toInt()}"),

              Slider(
                min: 1,
                max: 10,
                divisions: 9,
                value: valor,
                onChanged: (novoValor) {
                  alterarSlider(novoValor);
                },
              ),

              SizedBox(height: 30),

                // IconButton(
              //   icon: Icon(Icons.favorite),
              //   onPressed: clicarIcone,
              // ), ===ICONE DO CORAÇÃO===

              // ===== TOTAL ======
              Text(
                "Total: R\$ ${total.toStringAsFixed(2)}",
                
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

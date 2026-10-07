# 🍔 Pedido de Lanche - Flutter

Aplicativo desenvolvido em **Flutter e Dart** como exercício da disciplina de **Desenvolvimento Mobile**, com o objetivo de praticar componentes interativos e atualização de estado utilizando `StatefulWidget` e `setState()`.

## 📱 Sobre o Projeto

O aplicativo simula um pedido de lanche, permitindo selecionar o tipo de lanche, adicionar queijo, escolher entrega e definir a quantidade desejada.

O valor total do pedido é atualizado automaticamente sempre que uma das opções é alterada.

## 🍔 Opções de Lanche

O usuário pode escolher entre:

- **X-Burger** — R$ 10,00
- **X-Salada** — R$ 15,00
- **X-Tudo** — R$ 20,00

A seleção é realizada utilizando o componente `SegmentedButton`.

## 🧀 Adicional de Queijo

O `Checkbox` permite adicionar queijo ao pedido.

```text
Adicional de queijo: + R$ 5,00
```

## 🛵 Entrega

O `Switch` permite definir se o pedido será entregue.

```text
Taxa de entrega: + R$ 8,00
```

## 🔢 Quantidade

A quantidade de lanches é definida utilizando um `Slider`.

O controle permite selecionar valores inteiros de **1 a 10**.

## 💰 Cálculo do Total

O valor total é recalculado automaticamente sempre que o usuário altera:

- O lanche selecionado
- O adicional de queijo
- A opção de entrega
- A quantidade

O cálculo utilizado é:

```text
Total = (Preço do Lanche + Adicional de Queijo) × Quantidade + Entrega
```

### Exemplo

Considerando:

```text
X-Burger:      R$ 10,00
Queijo:        R$  5,00
Quantidade:    2
Entrega:       R$  8,00
```

O resultado será:

```text
(10 + 5) × 2 + 8 = R$ 38,00
```

## 🧩 Componentes Praticados

Durante o exercício foram utilizados:

- `StatefulWidget`
- `setState()`
- `SegmentedButton`
- `ButtonSegment`
- `Checkbox`
- `Switch`
- `Slider`
- `Text`
- `AppBar`
- `Column`
- `Padding`
- `SizedBox`

## 🔄 Atualização de Estado

Cada componente possui uma função responsável por atualizar seu respectivo estado.

Após uma alteração, a função `calcularTotal()` é executada e o `setState()` reconstrói a interface com o novo valor.

Exemplo:

```dart
void alterarCheckbox(bool novoValor) {
  setState(() {
    aceito = novoValor;
    calcularTotal();

    print(novoValor);
  });
}
```

O mesmo padrão é utilizado para o `Switch`, `Slider` e `SegmentedButton`.

## 🛠️ Tecnologias Utilizadas

- Flutter
- Dart
- Material Design
- Git
- GitHub

## 🎓 Objetivo Acadêmico

Exercício desenvolvido para praticar o gerenciamento de estado e o funcionamento de diferentes componentes interativos do Flutter.

## 👨‍💻 Autor

**Luan Araujo**

Projeto desenvolvido durante o curso Técnico em Desenvolvimento de Sistemas.
import 'dart:math';

class Calculadora {
  static num calculaMedida(num a, num b, num c) {
    // a-b
    // c-x
    // x = (b*c)/a
    return num.parse(((b * c) / a).toStringAsFixed(2));
  }

  static String calculadoraAjuda() {
    String mensagemCalculadoraAjuda = '''
    a-b
    c-x
    x = (b*c)/a''';
    return mensagemCalculadoraAjuda;
  }

  static String formataCalculo(List<String> valor) {
    var resultado = valor.join(' -> ');
    return resultado;
  }

  static String formatadorFinal(num valor, num resultado, String nomeMedida) {
    return formataCalculo([
      nomeMedida,
      valor.toString(),
      resultado.toString(),
      resultado.round().toString()
    ]);
  }

  static void calculaListaMedidas(Map<String, num> map, num a, num b) {
    map.forEach((key, value) {
      print(Calculadora.formatadorFinal(
          value, Calculadora.calculaMedida(a, b, value), key));
    });
  }

  static num perimetroCirculo(num valor) {
    return (2 * pi * valor);
  }

  static Map<dynamic, dynamic> teoremaDePitagoras2({
    num cateto1 = 0,
    num cateto2 = 0,
    num hipotenusa = 0,
  }) {
    num resultado = 0;
    String nomeCampo = '';

    // Map<dynamic, dynamic> campos = {
    //   '_cateto1': 'cateto_1',
    //   '_cateto2': 'cateto_2',
    //   '_hipotenusa': 'hipotenusa',
    // };

    if (cateto1 == 0) {
      nomeCampo = 'Cateto 1';
      resultado = sqrt(pow(hipotenusa, 2) - pow(cateto2, 2));
      return {
        'nomeCampo': nomeCampo,
        'resultado': resultado,
      };
    } else if (cateto2 == 0) {
      nomeCampo = 'Cateto 2';
      resultado = sqrt(pow(hipotenusa, 2) - pow(cateto1, 2));
      return {
        'nomeCampo': nomeCampo,
        'resultado': resultado,
      };
    } else if (hipotenusa == 0) {
      nomeCampo = 'Hipotenusa';
      resultado = sqrt(pow(cateto1, 2) + pow(cateto2, 2));
      return {
        'nomeCampo': nomeCampo,
        'resultado': resultado,
      };
    }
    // nomeCampo = '';
    return {
      'nomeCampo': '',
      'resultado': 0,
    };
  }

  static num teoremaDePitagoras({
    num cateto1 = 0,
    num cateto2 = 0,
    num hipotenusa = 0,
  }) {
    num resultado = 0;

    if (cateto1 == 0) {
      // nomeCampo = 'Cateto 1';
      resultado = sqrt(pow(hipotenusa, 2) - pow(cateto2, 2));
      return resultado;
    } else if (cateto2 == 0) {
      // nomeCampo = 'Cateto 2';
      resultado = sqrt(pow(hipotenusa, 2) - pow(cateto1, 2));
      return resultado;
    } else if (hipotenusa == 0) {
      // nomeCampo = 'Hipotenusa';
      resultado = sqrt(pow(cateto1, 2) + pow(cateto2, 2));
      return resultado;
    }
    // nomeCampo = '';
    return resultado;
  }
}

main(List<String> args) {
  num x = Calculadora.teoremaDePitagoras(cateto1: 3, cateto2: 4);
  print(x);
}

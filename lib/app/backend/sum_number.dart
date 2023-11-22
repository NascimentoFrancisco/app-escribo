

class SumNumbers{

  int sumIntegerDivisors(String value){
    
    int number = 0;

    // Covertendo o parâmetro para o tipo inteiro, se for inválido retorna um erro
    try{
      number = int.parse(value);
    } catch(e){
      throw ArgumentError("O número dever ser inteiro e positivo");
    }

    int sum = 0;
    // Verificação se o número é positivo, caso não seja uma mensgam de erro
    if(number <= 0 ){
      throw ArgumentError("O número dever ser inteiro e positivo");
    }

    for (int num = 3; num < number; num++){
      // Lógica para verificar se o número é divisível por 3 ou 5
      if (num % 3 == 0 || num % 5 == 0){
        sum += num;
      }
    }

    return sum;
  }

}
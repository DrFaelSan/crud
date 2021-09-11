import 'package:flutter/rendering.dart';

class UserValidator{
  
  //Inserindo validação de teste somente para abstração !! Não consta no curso.
  String  validarNome(String _nome)
  {    
      if(_nome == null && _nome.trim().isEmpty)
      {
        return 'Insira um nome por gentileza';
      }

      if(_nome.trim().length < 3)
      {
        return 'Não existe nome com apenas 2 caracteres. mínimo 3 letras';
      }

      return null;
  }


}
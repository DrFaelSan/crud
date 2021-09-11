import 'dart:math';

import 'package:crud/data/mocks_users.dart';
import 'package:crud/models/user.dart';
import 'package:flutter/cupertino.dart';

class  Users with ChangeNotifier {
  final Map<String, User> _items = {...MOCKS_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put (User user)
  {
    if(user == null) 
    {
      return;
    }

    if(user.id != null 
        && user.id.trim().isNotEmpty 
        && _items.containsKey(user.id))
    {
      //alterar
      _items.update(user.id, (_) => User(
          id:  user.id,
          nome: user.nome,
          email: user.email,
          avatarUrl: user.avatarUrl,
        ),
      );
    }
    else{
      //adicionar
      final id = Random().nextDouble().toString();
      _items.putIfAbsent('1000', () => User(
        id: id,
        nome: user.nome,
        email: user.email,
        avatarUrl: user.avatarUrl,
      ));
    }

     notifyListeners();

  }

  void remove(User user)
  {
    if(user != null && user.id != null) {
      _items.remove(user.id);
      notifyListeners();
    }
  }

}
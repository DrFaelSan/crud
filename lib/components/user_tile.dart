import 'package:crud/models/user.dart';
import 'package:crud/routes/app_routes.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget{
  //propriedade
  final User user;

  //Construtor do meu Widget userTile.
  const UserTile(this.user);
      
  
  @override
    Widget build(BuildContext context)
    {
      //verifico se meu usuário tem url para o avatar dele senão exibo um icone de pessoa no lugar.
      final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
      
      
      return ListTile(
        leading: avatar,
        title: Text(user.nome),
        subtitle: Text(user.email),
        trailing: Container(
          width: 100,
           child: Row(children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit), 
              color: Colors.purple,
              onPressed: () {
                 Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM,
                  arguments: user,
                );
              },),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {},)
          ],),
        )
      );
    }
}
import 'package:crud/components/user_tile.dart';
import 'package:crud/data/mocks_users.dart';
import 'package:crud/models/user.dart';
import 'package:crud/provider/users.dart';
import 'package:crud/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override 
    Widget build(BuildContext context)
    {
      final Users users = Provider.of(context, listen: true);

      return Scaffold(
        appBar: AppBar(
          title: Text('Usuários') ,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                //pushNamed eu adiciono a tela da minha rota para minha pilha de telas assim consigo retornar para tela anterior..
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM
                );
              },
              )
          ],
        ),
        body: ListView.builder( 
            itemCount: users.count,
            itemBuilder: (context, indice) => UserTile(users.byIndex(indice)),
        ),
      ); 
    }
}
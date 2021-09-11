import 'package:crud/provider/users.dart';
import 'package:crud/routes/app_routes.dart';
import 'package:crud/views/user_form.dart';
import 'package:crud/views/user_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider (
        create: (context) => Users(),
        )
      ] ,
      child: MaterialApp(
          debugShowCheckedModeBanner: false, //Remove o banner de Debug do canto superior direito.
          title: 'Inicio',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          // home: UserList(), //Quando não trabalhamos com rotas devemos colocar essa propriedade do MaterialApp
          routes: {
            AppRoutes.HOME: (_) => UserList(), // Como a rota da home é o / então posso só inserir nessa linha que o flutter indentifica que essa é minha home.
            AppRoutes.USER_FORM: (_) => UserForm(),
          },
        ),
    );     
  }
}

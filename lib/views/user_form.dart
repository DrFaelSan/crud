import 'package:crud/models/user.dart';
import 'package:crud/provider/users.dart';
import 'package:crud/validations/user_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {

  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Usuário'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
             onPressed: () {
                
                final isValid = _form.currentState.validate();

                if(isValid)
                {
                  _form.currentState.save();
                  
                  Provider.of<Users>(context, listen: false).put(
                    User(
                      nome: _formData['nome'], 
                      email: _formData['email'],
                      avatarUrl: _formData['avatarUrl']
                    )
                  );
                  
                  Navigator.of(context).pop();

                 SnackBar(content: Text('Salvando Usuário'));
                }
                else
                {
                  SnackBar(content: Text('Usuário Inválido, não salvo.'));
                }
                
             })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Nome'
                ),
                validator: (value) {
                    return UserValidator().validarNome(value.trim());
                },
                onSaved: (value) => _formData['nome'] = value ,
              ),
              TextFormField(
                decoration: InputDecoration(
                   prefixIcon: Icon(Icons.email),
                  labelText: 'Email'
                ),
                onSaved: (value) => _formData['email'] = value ,
              ),
              TextFormField(
                decoration: InputDecoration(
                   prefixIcon: Icon(Icons.link),
                  labelText: 'URL do Avatar'
                ),
                onSaved: (value) => _formData['avatarUrl'] = value ,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
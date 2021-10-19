import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api/user.dart';

import 'package:flutter_api/api.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  build(context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Http-Json-ListView',
      home: BuildListView(),
    );
  }
}

class BuildListView extends StatefulWidget {
  const BuildListView({Key? key}) : super(key: key);

  @override
  _BuildListViewState createState() => _BuildListViewState();
}

class _BuildListViewState extends State<BuildListView> {
  // var users = new List<User>;
  var users = <User>[];

  getUsers() {
    API.getUsers().then((response) {
      setState(() {
        Iterable lista = json.decode(response.body);
        users = lista.map((model) => User.fromJson(model)).toList();
      });
    });
  }

  _BuildListViewState() {
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Usuarios'),
          centerTitle: true,
        ),
        body: listaUsuarios());
  }

  listaUsuarios() {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(
            users[index].name,
            style: const TextStyle(fontSize: 20.0, color: Colors.black),
          ));
        });
  }
}

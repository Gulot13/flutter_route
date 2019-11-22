import 'package:flutter/material.dart';
import 'todoList.dart';

void main() => runApp(new multiPage());

class multiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/' : (context) => BaseApp(),
        '/todoList' : (context) => TodoList(),
      },
    );
  }
}

class BaseApp extends StatelessWidget {
  @override
  Widget build (BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Appli multi page"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            FlatButton(
              child: Text("To do list"),
              color: Colors.blue,
              onPressed: (){
                Navigator.pushNamed(context, "/todoList");
              },
            )
          ],
        )
      ),
    );
  }
}
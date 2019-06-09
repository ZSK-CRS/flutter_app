import 'package:flutter/material.dart';

//StatelessWidget与基础组件
class LessGroupPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: "StalessWidget与基础组件",
      theme: ThemeData(
          primarySwatch: Colors.amber

      ),
      home: Scaffold(
          appBar: AppBar(title: Text("标题")),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white
          ),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Text("I am Text,haha")
            ],
          ),
        ),
      ),
    );
  }
}


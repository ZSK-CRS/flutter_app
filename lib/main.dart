import 'package:flutter/material.dart';
import 'package:flutter_app/statefull_group_oage.dart';

import 'flutter_layout_page.dart';
import 'less_group_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("如何创建和使用Flutter的路由与导航"),
        ),
        body: RouteNavigator(),
      ),
      routes: <String, WidgetBuilder>{
        "less": (BuildContext context) => LessGroupPage(),
        "ful": (BuildContext context) => StateFullGroup(),
        "layout": (BuildContext context) => FlutterLayoutPage(),
      },
    );
  }
}

class RouteNavigator extends StatefulWidget {
  @override
  _RouteNavigatorState createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  bool byName = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SwitchListTile(
            title: Text("${byName ? "" : "不"}通过路由名跳转"),
            value: byName,onChanged: (value){
              setState(() {
                byName = value;
              });
          },
          ),
          _item("StateLessWidget与基础组件", LessGroupPage(), "less"),
          _item("StateFulWidget与基础组件", StateFullGroup(), "ful"),
          _item("如何进行Flutter布局开发", FlutterLayoutPage(), "layout"),
        ],
      ),
    );
  }

  _item(String title, page, String routeName) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          if (byName) {    //通过Name
            Navigator.pushNamed(context, routeName);
          } else {    //通过
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
          }
        },
        child: Text(title),
      ),
    );
  }
}

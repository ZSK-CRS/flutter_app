import 'package:flutter/material.dart';

//如何进行Flutter的布局开发
class FlutterLayoutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FlutterLayoutPageState();
  }
}

class _FlutterLayoutPageState extends State<FlutterLayoutPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "如何进行Flutter布局开发",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("哈哈"),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  ClipOval(
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.network(
                        "http://imgup02.sj88.com/2018-08/13/09/15341244804485_0.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: ClipRRect(
                      //设置圆角
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Opacity(
                        opacity: 0.6, //透明度
                        child: Image.network(
                          "http://imgup02.sj88.com/2018-08/13/09/15341244804485_0.png",
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                  height: 100,
                  margin: EdgeInsets.all(10),
                 // decoration: BoxDecoration(color: Colors.lightBlueAccent),   背景色
                  child: PhysicalModel(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(6),
                    clipBehavior: Clip.antiAlias, //抗锯齿
                    child: PageView(
                      children: <Widget>[
                        _item("Page1", Colors.deepPurple),
                        _item("Page1", Colors.green),
                        _item("Page1", Colors.red),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  _item(String title, Color color) {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(color: color),
        child:
            Text(title, style: TextStyle(fontSize: 22, color: Colors.white)));
  }
}

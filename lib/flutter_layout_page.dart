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
                ),
              ),
              Column(
                children: <Widget>[
                  FractionallySizedBox(
                    widthFactor: 1,
                    child: Container(
                      decoration: BoxDecoration(color: Colors.greenAccent),
                      child: Text("宽度撑满"),
                    ),
                  ),
                  Stack(   //帧布局
                    children: <Widget>[
                      Image.network("http://imgup02.sj88.com/2018-08/13/09/15341244804485_0.png",width: 100,height: 100,),
                      Positioned(
                        left: 0,bottom: 0,
                        child: Image.network("http://imgup02.sj88.com/2018-08/13/09/15341244804485_0.png",width: 60,height: 60,),
                      )
                    ],
                  ),
                  Wrap(
                    //创建一个Wrap布局，从左向右进行排列，会自动换行
                    spacing: 8,   //水平间距
                    runSpacing: 6,  //垂直距离
                    children: <Widget>[
                      _chip("绿蚁新醅酒"),
                      _chip("红泥小火炉"),
                      _chip("晚来天欲雪"),
                      _chip("能饮一杯无"),
                    ],
                  )
                ],
              )
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

  _chip(String label) {
    return Chip(label: Text(label),
      avatar: CircleAvatar(
        backgroundColor: Colors.blue.shade900,
        child: Text(
          label.substring(0,1),
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}

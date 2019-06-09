
import 'package:flutter/material.dart';

//StatefulWifget与基础组件
class StateFullGroup extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_StatefulGroupState();

}

class _StatefulGroupState extends State<StateFullGroup>{
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "StateFulWidget与基础组件",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("状态组件",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 22
              ),
          ),
        ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index){
                setState(() {
                  _currentIndex = index;
                });
              },
              items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,color: Colors.grey,),
              activeIcon: Icon(Icons.home,color: Colors.blue,),
              title: Text("首页")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.list,color: Colors.grey,),
                activeIcon: Icon(Icons.list,color: Colors.blue,),
                title: Text("列表")
            )
          ]),
          body: _currentIndex == 0?Container(
            decoration: BoxDecoration(color: Colors.white),
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Text("I am Text",style: TextStyle(
                    fontSize: 30
                )
                )
              ],
            ),
          ):Text("第二个页面")
      ),
    );
  }

}
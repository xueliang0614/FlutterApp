import 'package:flutter/material.dart';
import 'news/NewList.dart';
void main()=>runApp(Myapp());

class Myapp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  new MaterialApp(
      title: "app",
      home: new Home(),
      // ignore: argument_type_not_assignable
      theme: ThemeData(primarySwatch: Colors.red),

    );
  }
}
//home
class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(length: 3, child:Scaffold(
      // ignore: argument_type_not_assignable
      appBar: new AppBar(
        title: new Text("首页"),
        centerTitle: true ,  //标题文字居中
        //右侧搜送
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){})
        ],
      ),
      //左侧
      drawer: Drawer(
        child: ListView(
          //设置填充导航栏
          padding: EdgeInsets.all(0),
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: new Text("xueliangliang"),
              accountEmail: new Text("414920289@qq.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage("https://i2.hdslb.com/bfs/face/64dfd9caa18322457758f773db62b783b061ece3.jpg@72w_72h.webp"),
              ),
              //美化背景
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image:
                      NetworkImage("http://s.cn.bing.net/th?id=OHR.ZumwaltPrairie_ZH-CN4572430876_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp")
                  )
              ),
            ),

            //设置条目
            ListTile(title: new Text("用户反馈"),trailing: Icon(Icons.sms),),
            //设置条目
            ListTile(title: new Text("系统设置"),trailing: Icon(Icons.settings),),
            //设置条目
            ListTile(title: new Text("我要收藏"),trailing: Icon(Icons.border_color),),
            //设置分割线
            Divider(),
            //设置条目
            ListTile(title: new Text("注销"),trailing: Icon(Icons.lock_outline),),
            ListTile(title: new Text("关于"),trailing: Icon(Icons.assignment_late),)


          ],
        ),
      ),
      body: new TabBarView(children: <Widget>[
               new NewList(newslist: "1"),
               new NewList(newslist: "2"),
               new NewList(newslist: "3"),

      ],),

      //设置底部的tab
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.black

        ),
        height: 50,
        child: TabBar(
          labelStyle: TextStyle(height: 0
          ,fontSize: 10
          ),
          tabs: <Widget>[
          Tab(
              icon: Icon(Icons.fastfood),
              text:  "设置"
          ),

          Tab(
              icon: Icon(Icons.fastfood),
              text:  "设置"
          ),

          Tab(
              icon: Icon(Icons.fastfood),
              text:  "设置"
          )

        ],),
      )

    ));
  }
}
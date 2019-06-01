import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import 'package:toast/toast.dart';

import 'NewsDetils.dart';

//创建请求对象
Dio dio = new Dio();
class NewList extends StatefulWidget{
  //创建初始化方法传值
  /**
   * @required表示必须传参数
   *
   */
  NewList({Key key,@required this.newslist}):super(key:key);
  final String newslist;
  @override
  _NewListState createState() {
    return new _NewListState();
  }
}
//创建管理类
class _NewListState extends State<NewList> with AutomaticKeepAliveClientMixin{
  /**
   * 控件创建的额时候调用的
   */
    @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    /**
     *  两个类中私有的方法无法被使用
     *  使用 widget.newslist
     *  widget表示被管理的类
     **/
    return new ListView.builder(
      itemCount: s.length,
       itemBuilder: (context,index){
         var da=s[index];
         String text=da['title'];
        var title= text.substring(0,6);
        return  GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext ctx){
              return new NewsDetils(aid:da['aid'],title:da['title'],source_url:da['source_url']);
            }));
          },
          child:  Container(
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    top: BorderSide(
                      color: Colors.black,
                    )
                )
            ),
            child:
            new Row(
              children: <Widget>[
                Image.network(da['headpic'],width: 180.0,height: 100.0,fit: BoxFit.cover,),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  height: 110,
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      //条目一
                      Text("来源 : ${da['source']}"),
                      //条目2
                      Text("标题 : $title",
                        maxLines: 1,
                        overflow:TextOverflow.ellipsis ,
                      ),
                      Text("时间 : ${da['pub_time']}"),
                    ],
                  )
                  ,)
              ],
            ),
          ),
        );
       },
    );
  }

  var data;
  var count=0;
  var code="";
  var s=[];
  //创建网络获取数据
   getData() async{
    var resposen= await dio.get("http://api.dagoogle.cn/news/nlist");
       var d=resposen.data;
      // print(d.toString()+"--------------------------------------------------------------------------------------------------------");
    //Toast.show("鉴权失败！", context, duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
       //为私有数据赋值
       setState(() {
           data=d['data'];
           s=data['list'];
           count=d['total'];
           code=d['code'];
       });
   }



  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
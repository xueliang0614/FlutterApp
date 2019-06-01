import 'package:flutter/material.dart';
class NewsDetils extends  StatefulWidget{

  /**
   * 构造方法方便传值
   *
   */
  NewsDetils({Key key, @required this.aid,@required this.title,@required this.source_url}):super(key :key);
  final String aid;
  final String title;
  final String source_url;

  @override
  _NewsDetilsState createState() {
    // TODO: implement createState
    return _NewsDetilsState();
  }

}


class _NewsDetilsState extends State<NewsDetils>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  new Text("sdsdsd "+widget.title);
  }

}
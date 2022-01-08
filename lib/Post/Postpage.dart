import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bybloom_mvp/Post/Post.dart';
class PostViewPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _PostViewPage();

}

class _PostViewPage extends State<PostViewPage>{

  List<Post> postlist= Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: postlist.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      child:GridTile(
                          child: InkWell(
                            child:Image.network(postlist[index].downloadURL!),
                            onTap: (){},
                          )
                      )
                  );
                }),
          ),

          Container(color: Colors.red,)
        ],
      ),


      );

  }
}
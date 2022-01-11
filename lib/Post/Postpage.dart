import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                            child: ExtendedImage.network(
                                postlist[index].downloadURL!,fit: BoxFit.contain,cache: true,),
                            onTap: (){
                              showDialog(context: context,
                                  builder: (BuildContext context)=>
                                AlertDialog(
                                  alignment: Alignment.center,
                                 actions
                                    : <Widget>[
                                      Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                        children:<Widget>[
                                      TextButton(onPressed:(){}, child: Text('수정',textAlign: TextAlign.end,),),
                                      TextButton(onPressed:(){}, child: Text('삭제',textAlign: TextAlign.center))

                              ]
                                      )],
                                  ),
                                );
                            },
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
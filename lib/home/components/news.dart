import 'package:flutter/material.dart';


class PeopleNews extends StatefulWidget {
  const PeopleNews({Key? key}) : super(key: key);

  @override
  _PeopleNewsState createState() => _PeopleNewsState();
}

class _PeopleNewsState extends State<PeopleNews> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('교인소식',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
        Card(

          color: Colors.transparent,
          elevation: 0,
          child: Row(
            mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    width:80,
                    height: 80,
                    child:Image.network('https://postfiles.pstatic.net/MjAyMTEwMjdfMTk4/MDAxNjM1MzQwMjYwMjE1.NM91425fGOCAGAVsGSk84i66w1PVrWWc6YFPvllJiNQg.OwfgrLWEVmaed1hnHZoCaP7VyNS4rKnRWQcsrORiyX0g.JPEG.speakerhong/IMG_8675.JPG?type=w580',
                        fit: BoxFit.cover,
                        ),
                      ),
                ),
                SizedBox(width: 10,),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width:MediaQuery.of(context).size.width*0.9-100, child: Text('김정한 장로님의 손자인 김태인 청년의 결혼식입니다',style: TextStyle(color: Color(0xff9e9e9e)),)),
                    SizedBox(height: 5,),
                    SizedBox(width:MediaQuery.of(context).size.width*0.9-100, child: Text('12/23 오후 2시 신세계 컨벤션홀에서 열립니다.',style: TextStyle(color: Color(0xff9e9e9e)),maxLines: 1,overflow: TextOverflow.ellipsis,)),

                  ],),

              ],
            ),

        ),
        Card(

          color: Colors.transparent,
          elevation: 0,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  width:80,
                  height: 80,
                  child:Image.network('https://i.pinimg.com/564x/97/d7/33/97d733f3cb7c720ca6825b2d4f215e1c.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width:MediaQuery.of(context).size.width*0.9-100, child: Text('교역자 부임 안내입니다',style: TextStyle(color: Color(0xff9e9e9e)),)),
                  SizedBox(height: 5,),
                  SizedBox(width:MediaQuery.of(context).size.width*0.9-100, child: Text('이영한 전도사님이 오늘부로 부임하셨습니다',style: TextStyle(color: Color(0xff9e9e9e)),maxLines: 1,overflow: TextOverflow.ellipsis,)),

                ],),

            ],
          ),

        ),


      ],
    );
  }
}

class ChurchNews extends StatefulWidget {
  const ChurchNews({Key? key}) : super(key: key);

  @override
  _ChurchNewsState createState() => _ChurchNewsState();
}

class _ChurchNewsState extends State<ChurchNews> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('교회소식',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
        SizedBox(height: 5,),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 2),
          child: Text('부모를 위한 성경적 성 가치관 학교 수강생 모집합니다',style: TextStyle(color:Color(0xff9e9e9e) ),),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 2),
          child: Text('교육부 교사 모집합니다',style: TextStyle(color:Color(0xff9e9e9e)),)
        ),
        Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 2),
            child: Text('사랑의 선물 봉사 사진입니다:)',style: TextStyle(color:Color(0xff9e9e9e)),)
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 3),
              child: Image.network(
                'https://i.pinimg.com/736x/56/5c/85/565c852c7448cc27746fd05e96b2c668.jpg',
                width: MediaQuery.of(context).size.width*0.9/4,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 3),
              child: Image.network(
                'https://i.pinimg.com/736x/56/5c/85/565c852c7448cc27746fd05e96b2c668.jpg',
                width: MediaQuery.of(context).size.width*0.9/4,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Image.network(
                'https://i.pinimg.com/736x/56/5c/85/565c852c7448cc27746fd05e96b2c668.jpg',
                width: MediaQuery.of(context).size.width*0.9/4,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            Icon(Icons.more_horiz,size: 40,color: Colors.grey,)
          ],
        ),
        SizedBox(height: 20,),



      ],
    );
  }
}





class NewsBoard extends StatefulWidget {
  final String type;
  const NewsBoard({Key? key, required this.type}) : super(key: key);


  @override
  _NewsBoardState createState() => _NewsBoardState();
}

class _NewsBoardState extends State<NewsBoard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${widget.type}소식',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)
      ],
    );
  }
}

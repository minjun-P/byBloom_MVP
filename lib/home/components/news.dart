import 'package:bybloom_mvp/home/detail_pages/church_news_page.dart';
import 'package:bybloom_mvp/home/detail_pages/people_news_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bybloom_mvp/home/home_controller.dart';

class PeopleNews extends StatelessWidget {
  const PeopleNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PeopleNewsController controller = Get.put(PeopleNewsController());
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => Get.to(PeopleNewsPage()),
          child: Text('교인소식',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),),
        ),
        Obx(()=>Card(

          color: Colors.transparent,
          elevation: 0,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: SizedBox(
                    width:80.w,
                    height: 80.h,
                    child:Image.network(controller.board1['url']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              SizedBox(width: 10,),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width:260.w, child: Text(controller.board1['title']!,style: TextStyle(color: Color(0xff9e9e9e)),)),
                  SizedBox(height: 5.h,),
                  SizedBox(width:260.w, child: Text(controller.board1['content']!,style: TextStyle(color: Color(0xff9e9e9e)),maxLines: 1,overflow: TextOverflow.ellipsis,)),

                ],),

            ],
          ),

        ),),
        Obx(()=>Card(

          color: Colors.transparent,
          elevation: 0,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: (){
                  controller.change();
                },
                onDoubleTap: () {
                  controller.changeBack();
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    width:80.w,
                    height: 80.h,
                    child:Image.network(controller.board2['url']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w,),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width:260.w, child: Text(controller.board2['title']!,style: TextStyle(color: Color(0xff9e9e9e)),)),
                  SizedBox(height: 5,),
                  SizedBox(width:260.w, child: Text(controller.board2['content']!,style: TextStyle(color: Color(0xff9e9e9e)),maxLines: 1,overflow: TextOverflow.ellipsis,)),

                ],),

            ],
          ),

        ),),
        SizedBox(height: 10.h,)


      ],
    );
  }
}

/**
class PeopleNews extends StatefulWidget {
  const PeopleNews({Key? key}) : super(key: key);

  @override
  _PeopleNewsState createState() => _PeopleNewsState();
}

class _PeopleNewsState extends State<PeopleNews> {
  @override
  Widget build(BuildContext context) {
    PeopleNewsController controller = Get.put(PeopleNewsController());
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => Get.to(PeopleNewsPage()),
          child: Text('교인소식',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),),
        ),
        Card(

          color: Colors.transparent,
          elevation: 0,
          child: Row(
            mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: SizedBox(
                    width:80.w,
                    height: 80.h,
                    child:Image.network(controller.board1['url']!,
                        fit: BoxFit.cover,
                        ),
                      ),
                ),
                SizedBox(width: 10,),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width:260.w, child: Text(controller.board1['title']!,style: TextStyle(color: Color(0xff9e9e9e)),)),
                    SizedBox(height: 5.h,),
                    SizedBox(width:260.w, child: Text(controller.board1['content']!,style: TextStyle(color: Color(0xff9e9e9e)),maxLines: 1,overflow: TextOverflow.ellipsis,)),

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
                  width:80.w,
                  height: 80.h,
                  child:Image.network(controller.board2['url']!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10.w,),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width:260.w, child: Text(controller.board2['title']!,style: TextStyle(color: Color(0xff9e9e9e)),)),
                  SizedBox(height: 5,),
                  SizedBox(width:260.w, child: Text(controller.board2['content']!,style: TextStyle(color: Color(0xff9e9e9e)),maxLines: 1,overflow: TextOverflow.ellipsis,)),

                ],),

            ],
          ),

        ),
        SizedBox(height: 10.h,)


      ],
    );
  }
}
*/
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
        InkWell(
          onTap: () => Get.to(ChurchNewsPage()),
          child: Text('교회소식',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),),
        ),
        SizedBox(height: 5,),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: Text('부모를 위한 성경적 성 가치관 학교 수강생 모집합니다',style: TextStyle(color:Color(0xff9e9e9e) ),),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: Text('교육부 교사 모집합니다',style: TextStyle(color:Color(0xff9e9e9e)),)
        ),
        Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 2.h),
            child: Text('사랑의 선물 봉사 사진입니다:)',style: TextStyle(color:Color(0xff9e9e9e)),)
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 3.w),
              child: Image.network(
                'https://i.pinimg.com/736x/56/5c/85/565c852c7448cc27746fd05e96b2c668.jpg',
                width: 90.w,
                height: 80.h,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 3),
              child: Image.network(
                'https://i.pinimg.com/736x/56/5c/85/565c852c7448cc27746fd05e96b2c668.jpg',
                width: 90.w,
                height: 80.h,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Image.network(
                'https://i.pinimg.com/736x/56/5c/85/565c852c7448cc27746fd05e96b2c668.jpg',
                width: 90.w,
                height: 80.h,
                fit: BoxFit.cover,
              ),
            ),
            Icon(Icons.more_horiz,size: 40.sp,color: Colors.grey,)
          ],
        ),
        SizedBox(height: 20.h,),



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

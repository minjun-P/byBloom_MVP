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
          onTap: () => Get.to(PeopleNewsPage(),id: 0),
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
                    height: 80,
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
                    height: 80,
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

class ChurchNews extends StatelessWidget {
  const ChurchNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChurchNewsController controller = Get.put(ChurchNewsController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => Get.to(ChurchNewsPage(),id: 0),
          child: Text('교회소식',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),),
        ),
        SizedBox(height: 5,),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: Obx(()=>Text(controller.board1.string,style: TextStyle(color:Color(0xff9e9e9e) ),)),
        ),
        Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 2.h),
            child: Obx(()=>Text(controller.board2.string,style: TextStyle(color:Color(0xff9e9e9e) ),))
        ),
        Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 2.h),
            child: Obx(()=>Text(controller.board3['title']!,style: TextStyle(color:Color(0xff9e9e9e) ),))
        ),
        Row(
          children: [...List.generate(3,(index) {
            return Padding(
              padding: EdgeInsets.only(right: 3.w),
              child: Obx(() => Image.network(
                controller.board3['pic'][index],
                width: 90.w,
                height: 80,
                fit: BoxFit.cover,
              ),)
            );
          }),
          SizedBox(width: 10.w,),
          Icon(Icons.more_horiz,size: 40.sp,color: Colors.grey,)
          ]
        ),
        SizedBox(height: 20.h,),
      ],
    );
  }
}


import 'package:bybloom_mvp/schedule/components/calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'components/request.dart';
import 'package:get/get.dart';

import 'schedule_controller.dart';

class ScheduleScreen extends StatelessWidget {
  ScheduleScreen({Key? key}) : super(key: key);
  RequestController controller = Get.put(RequestController());
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.h),
          padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(controller.subtitle.value,
                style: TextStyle(color: Colors.grey, fontSize: 12.sp),),
              Text(controller.title.value,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),),
              Align(
                child: Container(
                  width: 190.w,
                  height: 45,
                  margin: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                      color: Color(0xffaaede4),
                      borderRadius: BorderRadius.circular(30.r)
                  ),
                  alignment: Alignment.center,
                  child: Text('지금 신청하기',
                    style: TextStyle(fontWeight: FontWeight.bold),),
                ),
              ),

            ],
          ),
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            RequestBlock(color: Color(0xfffff2cc),text: '예배',),
            RequestBlock(color: Color(0xfffce5cd),text: '봉사',),
            RequestBlock(color: Color(0xffd9ead3),text: '교육',),
            RequestBlock(color: Colors.white,text: '면담',),
          ],
        ),
        SizedBox(height: 30,),
        Calendar(),
        SizedBox(height: 20,)
      ],
    );
  }
}



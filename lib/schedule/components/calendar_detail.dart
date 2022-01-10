import 'package:bybloom_mvp/constants.dart';
import 'package:bybloom_mvp/schedule/schedule_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalendarDetailPage extends StatelessWidget {
  CalendarDetailPage({Key? key}) : super(key: key);

  final day = Get.parameters['day'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$day 일의 일정'),
        titleSpacing: 10,
      ),
      backgroundColor: MColor,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 0.05.sw),
        child: ListView(
          children: [
            GetBuilder<CalendarController>(
              builder: (_) => _detailBuilder('교회공식 일정',_.OfficialMap),
            ),
            GetBuilder<CalendarController>(
              builder: (_) => _detailBuilder('내가 신청한 일정',_.PersonalMap),
            )

          ],
        ),
      ),
    );
  }

  _detailBuilder(String title, Map schedule) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r)
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            Divider(thickness: 2,),
            ...List.generate(
                schedule.containsKey(day)?schedule[day]!.length:0,
                    (index) => Row(
                  children: [
                    Icon(Icons.task_alt,size: 17,),
                    SizedBox(width: 5.w,),
                    Text(schedule[Get.parameters['day']]![index], style: TextStyle(fontSize: 17),)
                  ],
                )
            )

          ]
      ),
    );
  }

}

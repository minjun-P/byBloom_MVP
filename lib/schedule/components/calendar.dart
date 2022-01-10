import 'package:flutter/material.dart';
import 'package:bybloom_mvp/schedule/model/calendar_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:bybloom_mvp/schedule/schedule_controller.dart';

class Calendar extends StatelessWidget {
  Calendar({Key? key}) : super(key: key);
  CalendarController controller = Get.put(CalendarController());

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Colors.white,
        ),

        child: Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(child: Center(child: Text('일',style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold),),), height: 50,),
                    Container(child: Center(child: Text('월',style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold),)), height: 50,),
                    Container(child: Center(child: Text('화',style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold),)), height: 50,),
                    Container(child: Center(child: Text('수',style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold),)), height: 50,),
                    Container(child: Center(child: Text('목',style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold),)), height: 50,),
                    Container(child: Center(child: Text('금',style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold),)), height: 50,),
                    Container(child: Center(child: Text('토',style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold),)), height: 50,),
                  ]
              ),
              Table(
                border: TableBorder(
                    top: BorderSide(width: 2, color: Colors.grey[300]!,),
                    horizontalInside: BorderSide(width: 2,color: Colors.grey[300]!),
                    verticalInside: BorderSide(width: 2, color: Colors.grey[300]!)),
                children: [
                  TableRow(
                      children:
                      List.generate(7,(index) {
                        return TableCell(
                          child: Container(
                            padding: EdgeInsets.only(top: 5.h),
                            height: 100.h,
                            child: Column(
                              children: [
                                Align(
                                    alignment: Alignment(-0.8,0),
                                    child: InkWell(
                                        onTap: () {
                                          controller.add(index+2);
                                          print(index+2);
                                        },
                                        child: Container(width:double.infinity,child: Text('${index+2}')))
                                ),
                                GetBuilder<CalendarController>(
                                  init: controller,
                                  builder: (_) =>_officialScheduleBuilder(_.OfficialMap,index+2),
                                )

                                ,
                                GetBuilder<CalendarController>(
                                  builder: (_) => _personalScheduleBuilder(_.PersonalMap,index+2),
                                )
                              ],

                            ),
                          ),
                        );
                      })

                  ),
                  TableRow(
                      children:
                      List.generate(7,(index) {
                        return TableCell(
                          child: Container(
                            padding: EdgeInsets.only(top: 5),
                            height: 90.h,
                            child: Column(
                              children: [
                                Align(
                                    alignment: Alignment(-0.8,-0),
                                    child: InkWell(
                                        onTap: (){
                                          controller.add(index+9);
                                        },
                                        child: Text('${index+9}')
                                    )
                                ),

                                GetBuilder<CalendarController>(
                                  init: controller,
                                  builder: (_) =>_officialScheduleBuilder(_.OfficialMap,index+9),
                                )

                                ,
                                GetBuilder<CalendarController>(
                                  builder: (_) => _personalScheduleBuilder(_.PersonalMap,index+9),
                                )
                              ],

                            ),
                          ),
                        );
                      })

                  ),

                ],
              ),
            ]
        )
    );

  }
  _officialScheduleBuilder(Map schedule,int day) {

    if (schedule.containsKey(day.toString())) {
      return Column(
        children: List.generate(schedule[day.toString()].length,(index) {
          return InkWell(
            onTap: (){
              Get.defaultDialog(
                  title: '$day일',
                  middleText: '${schedule[day.toString()][index]}',
                  textConfirm: '확인',
                  onConfirm: (){
                    Get.back();
                  }
              );
            },
            child: Container(
              height: 20.h,
              padding: EdgeInsets.symmetric(vertical: 3.h),
              width: 50.w,
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10.r)
              ),
              alignment: Alignment.center,
              child: Text(schedule[day.toString()][index],style: TextStyle(fontSize: 7.sp),),
            ),
          );
        }),
      );

    } else {
      return Container(
        height: 0,
      );
    }
  }
  _personalScheduleBuilder(Map schedule,int day) {

    if (schedule.containsKey(day.toString())) {
      return Column(
          children: List.generate(schedule[day.toString()].length, (index){
            return InkWell(
              onTap: (){
                Get.defaultDialog(
                    title: '$day일',
                    middleText: '${schedule[day.toString()][index]}',
                    textConfirm: '확인',
                    onConfirm: (){
                      Get.back();
                    }
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 3.h),
                height: 20.h,
                width: 50.w,
                margin: EdgeInsets.symmetric(horizontal: 4.w,vertical: 3.h),
                decoration: BoxDecoration(
                    color: day%2==0?Colors.cyan:Colors.yellow,
                    borderRadius: BorderRadius.circular(5.r)
                ),
                alignment: Alignment.center,
                child: Text(schedule[day.toString()][index],style: TextStyle(fontSize: 7.sp),),
              ),
            );
          })
      );


    } else {
      return Container(
        height: 0,
      );
    }
  }
}



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bybloom_mvp/schedule/schedule_controller.dart';
import 'package:get/get.dart';

class RequestBlock extends StatelessWidget {
  final String text;
  final Color color;
  RequestBlock({Key? key, required this. color, required this.text}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 0.05.sw),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.grey[300]!, width: 2),
      ),
      child: Center(
        child: Column(
          children: [
            Text(text,style: TextStyle(fontSize: 18.sp,color: Colors.grey),),
            Text('신청',style: TextStyle(fontSize: 18.sp,color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

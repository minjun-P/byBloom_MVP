import 'package:bybloom_mvp/home/detail_pages/notice_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bybloom_mvp/home/home_controller.dart';
import 'custom_dropdown.dart';

class NoticeBoard extends StatelessWidget {
  NoticeBoard({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Get.put(NoticeController());
    Get.put(DropDownController());
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: () => Get.to(()=>NoticePage(),id: 0),
                child: Text(
                  '공지사항',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              CustomDropDownButton(key: Get.find<DropDownController>().dropKey,),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.w),
            width: 0.9.sw,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => Text(Get.find<NoticeController>().board1['title']!,
                  style: TextStyle(color: Colors.grey),
                )),
                Obx(() => Text(Get.find<NoticeController>().board1['content']!,
                  style: TextStyle(color: Colors.grey),
                )),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10,),
          InkWell(
            onTap: (){
              Get.find<NoticeController>().change();
            },
            onDoubleTap: () {
              Get.find<NoticeController>().changeBack();
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.w),
              width: 0.9.sw,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => Text(Get.find<NoticeController>().board2['title']!,
                    style: TextStyle(color: Colors.grey),
                  )),
                  Obx(() => Text(Get.find<NoticeController>().board2['content']!,
                    style: TextStyle(color: Colors.grey),
                  )),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}




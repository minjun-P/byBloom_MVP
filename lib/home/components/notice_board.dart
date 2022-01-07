import 'package:bybloom_mvp/home/detail_pages/notice_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bybloom_mvp/home/home_controller.dart';

class NoticeBoard extends StatelessWidget {
  NoticeBoard({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Get.put(NoticeController());
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
                onTap: () => Get.to(NoticePage()),
                child: Text(
                  '공지사항',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Obx(() =>DropdownButton(
                  isDense: true,
                  itemHeight: null,
                  elevation: 2,
                  iconSize: 20.sp,
                  value: Get.find<NoticeController>().dropdownValue.toString(),
                  items: List.generate(
                      3,
                          (index) {
                        List optionList = ['최신순','조회순','인기순'];
                        return DropdownMenuItem(
                          child: Text(optionList[index],style: TextStyle(fontSize: 12.sp),),
                          value: optionList[index],
                        );
                      }
                  ),
                  onChanged: (value) {
                    Get.find<NoticeController>().dropdownValueChange(value);
                  }), )
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


/**
class NoticeBoard extends StatefulWidget {
  const NoticeBoard({Key? key}) : super(key: key);

  @override
  _NoticeBoardState createState() => _NoticeBoardState();
}

class _NoticeBoardState extends State<NoticeBoard> {

  final optionList = ['최신순','조회순','좋아요순'];
  String selectedOption = '최신순';
  @override
  Widget build(BuildContext context) {
    Get.put(NoticeController());
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
                onTap: () => Get.to(NoticePage()),
                child: Text(
                  '공지사항',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
               DropdownButton(
                 isDense: true,
                  itemHeight: null,
                  elevation: 2,
                  iconSize: 20.sp,
                  value: selectedOption,
                    items: List.generate(
                      optionList.length,
                        (index) {
                        return DropdownMenuItem(
                            child: Text(optionList[index],style: TextStyle(fontSize: 12.sp),),
                            value: optionList[index],
                        );
                        }
                    ),
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        selectedOption = value.toString();
                      });
                }),
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

*/





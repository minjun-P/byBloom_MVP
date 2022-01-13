import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bybloom_mvp/home/home_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDownButton extends GetView<DropDownController> {
  const CustomDropDownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(CustomDropDownList(),opaque: false,transition: Transition.fadeIn);
      },
      child: Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(30)
          ),
          child: Row(
              children: [
                Obx(()=>Text(controller.currentValue.value.name,style: TextStyle(fontSize: 13),)),
                Icon(Icons.arrow_drop_down)
              ]
          )
      ),
    );
  }
}




class CustomDropDownList extends GetView<DropDownController> {
  const CustomDropDownList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            top: 0,
            child: GestureDetector(
              onTap: ()=>Get.back(),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          Positioned(
            left: controller.positionX,
            top: controller.positionY-5.h,
            child: ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
              child: Column(
                  children: DropDownMenu.values.map(
                        (menu) => InkWell(
                      splashColor: Colors.transparent,
                      onTap: (){
                        print(menu.name);
                        Get.back();
                        controller.chageDropDownMenu(menu);
                      },
                      child: Ink(
                        padding: EdgeInsets.all(10),
                        color: Colors.white,
                        child: Text(
                          menu.name,
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                    ),

                  ).toList()
              ),
            ),
          )
        ]
        ,
      ),
    );
  }
}

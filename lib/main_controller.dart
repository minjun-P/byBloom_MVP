import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:bybloom_mvp/home/homescreen.dart';
import 'package:bybloom_mvp/profile/profilescreen.dart';
import 'package:bybloom_mvp/schedule/shcedulescreen.dart';


class MainController extends GetxController{
  var selectedIndex = 0.obs;
  var appBarList = ['시민의 교회','영성 스케쥴','프로필'].obs;

  void changeIndex(int index) {
    selectedIndex(index);
  }



  void canPop(int selectedIndex) {
    bool popable = Get.nestedKey(selectedIndex)!.currentState == null?false:Get.nestedKey(selectedIndex)!.currentState!.canPop();
    popPossible(popable);
  }

  RxBool popPossible = false.obs;


  Future<bool> onWillPop() async{
    final isFirstRouteInCurrentTab =
    ! await Get.nestedKey(selectedIndex.value)!.currentState!.maybePop();
    return isFirstRouteInCurrentTab;
  }


}
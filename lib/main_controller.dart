import 'package:get/get.dart';
import 'package:flutter/material.dart';


class MainController extends GetxController{
  var selectedIndex = 0.obs;
  var appBarList = ['시민의 교회','영성 스케쥴','프로필','피드'].obs;

  void changeIndex(int index) {
    selectedIndex(index);
  }

  RxList whetherCanPopEachNavigator = [false,false,false,false].obs;

  void updateWhetherCanPop(int index) {
    final whetherCanPop = Get.nestedKey(index)!.currentState!.canPop();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      whetherCanPopEachNavigator[index] = whetherCanPop;
    });
  }


  Future<bool> onWillPop() async{
    final isFirstRouteInCurrentTab =
    ! await Get.nestedKey(selectedIndex.value)!.currentState!.maybePop();
    return isFirstRouteInCurrentTab;
  }






}

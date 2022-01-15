import 'package:bybloom_mvp/Auth/authservice.dart';
import 'package:bybloom_mvp/feed/feedscreen.dart';
import 'package:bybloom_mvp/home/homescreen.dart';
import 'package:bybloom_mvp/profile/profilescreen.dart';
import 'package:bybloom_mvp/schedule/shcedulescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'main_controller.dart';

class MainScreen extends GetView<MainController> {
  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // 개별적인 Navigator 사용시, native 시스템이 해당 Navigator를 제대로 인식하기 못해
      // 뒤로 가기 버튼 시 앱이 그냥 종료되는 경우를 방지!
      onWillPop: controller.onWillPop,
      child: Obx(()=>Scaffold(
        appBar: AppBar(
          leading: controller.whetherCanPopEachNavigator[controller.selectedIndex.value]
              ?IconButton(icon: Icon(Icons.arrow_back),onPressed: () {Get.back(id: controller.selectedIndex.value);},)
              :null,
          title: Text(controller.appBarList[controller.selectedIndex.value]),
          actions: [
            IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  authservice.logout();
                  Get.offAllNamed('/');
                }
            ),
            SizedBox(width: 10.w,),
            Icon(Icons.menu),
            SizedBox(width: 10.w,),
            Icon(Icons.search),
            SizedBox(width: 10.w,),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
          color: Color(0xFFf1f8f7),
          child: IndexedStack(
            index: controller.selectedIndex.value,
            children: [
              Navigator(
                  key: Get.nestedKey(0),
                  observers: [GetObserver(MiddleWare.observer0)],
                  onGenerateRoute: (settings){
                    return GetPageRoute(
                        page: () => HomeScreen()
                    );
                  }
              ),
              Navigator(
                  key: Get.nestedKey(1),
                  observers: [GetObserver(MiddleWare.observer1)],
                  onGenerateRoute: (settings){
                    return GetPageRoute(
                        page: () => ScheduleScreen()
                    );
                  }
              ),
              Navigator(
                  key: Get.nestedKey(2),
                  observers: [GetObserver(MiddleWare.observer2)],
                  onGenerateRoute: (settings){
                    return GetPageRoute(
                        page: () => ProfileScreen()
                    );
                  }
              ),
              Navigator(
                  key: Get.nestedKey(3),
                  observers: [GetObserver(MiddleWare.observer3)],
                  onGenerateRoute: (settings){
                    return GetPageRoute(
                        page: () => FeedScreen()
                    );
                  }
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.auto_awesome_mosaic), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.perm_identity), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.feed), label: ''),
          ],
          onTap: (index) {
            controller.changeIndex(index);
          },
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          currentIndex: controller.selectedIndex.value,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ))
    );
  }
}

class MiddleWare {
  // 네비게이션 옵저버를 위한 클래스
  static observer0 (Routing? routing) {
    Get.find<MainController>().updateWhetherCanPop(0);
  }
  static observer1 (Routing? routing) {
    Get.find<MainController>().updateWhetherCanPop(1);
  }
  static observer2 (Routing? routing) {
    Get.find<MainController>().updateWhetherCanPop(2);
  }
  static observer3 (Routing? routing) {
    Get.find<MainController>().updateWhetherCanPop(3);
  }
}

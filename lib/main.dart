import 'package:bybloom_mvp/Auth/RegisterPage.dart';
import 'package:bybloom_mvp/Auth/loginPage.dart';
import 'package:bybloom_mvp/main_controller.dart';
import 'package:bybloom_mvp/mainscreen.dart';
import 'package:bybloom_mvp/schedule/components/calendar_detail.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bybloom_mvp/Post/Postpage.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(410,680),
      builder: () => GetMaterialApp(
        title: 'byBloom MVP',
        initialRoute: '/',
        initialBinding: BindingsBuilder((){
          Get.put(MainController());
        }),
        getPages: [
          GetPage(
            name: '/',
            page: () => LoginPage()
          ),
          GetPage(
            name: '/Main',
            page: () => MainScreen(),
          ),
          GetPage(
            name: '/Register',
            page: () => RegisterPage()
          ),
          GetPage(
            name:'/PostView',
            page:() => PostViewPage()
          ),
        ],

        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xFFf1f8f7),
            elevation: 0,
            titleTextStyle: TextStyle(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),
            titleSpacing: 40.w,
            toolbarHeight: 60.h,
            iconTheme: IconThemeData(
              color: Colors.grey
            )
          ),
        ),
      ),
    );
  }
}


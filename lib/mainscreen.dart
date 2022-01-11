import 'package:bybloom_mvp/Auth/authservice.dart';
import 'package:bybloom_mvp/home/homescreen.dart';
import 'package:bybloom_mvp/profile/profilescreen.dart';
import 'package:bybloom_mvp/schedule/shcedulescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  List<String> _appBarTitleList = ['시민의 교회','영성 스케쥴','프로필'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitleList[_selectedIndex]),
        actions: [
          IconButton(
            icon:Icon(Icons.logout),
            onPressed: (){
              authservice.logout();

              Get.offAllNamed('/');
    }

            ,
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
          index: _selectedIndex,
          children: [
            HomeScreen(),
            ScheduleScreen(),
            ProfileScreen()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.auto_awesome_mosaic),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.perm_identity),label: ''),
        ],

        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },

        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}

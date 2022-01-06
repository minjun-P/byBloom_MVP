import 'package:bybloom_mvp/home/homescreen.dart';
import 'package:bybloom_mvp/profile/profilescreen.dart';
import 'package:bybloom_mvp/schedule/shcedulescreen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFf1f8f7),
        elevation: 0,
        title: Text('시민의 교회',
          style: TextStyle(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        titleSpacing: 30,
        actions: const [
          Icon(Icons.notifications),
          SizedBox(width: 7,),
          Icon(Icons.menu),
          SizedBox(width: 7,),
          Icon(Icons.search),
          SizedBox(width: 7,),
        ],
        toolbarHeight: 60,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/20),
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

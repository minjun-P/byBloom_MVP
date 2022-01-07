import 'package:flutter/material.dart';
import 'package:bybloom_mvp/home/components/news.dart';
import 'components/notice_board.dart';
import 'package:bybloom_mvp/Tools/url_laucher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
            children: [
              InkWell(
                onTap: () async {
                  launchURL('https://youtu.be/Su8wzNZHdc4');
    },
                child: Container(
                  height: 80,
                  child: Center(child: Text('온라인 예배 바로가기',style: TextStyle(fontSize: 20),)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey, width: 1),
                    color: Colors.white
                  ),
                ),
              ),
              NoticeBoard(),
              PeopleNews(),
              SizedBox(height: 6,),
              ChurchNews(),
            ],
      );
  }
}

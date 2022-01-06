import 'package:bybloom_mvp/schedule/components/calendar.dart';
import 'package:flutter/material.dart';

import 'components/request.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('내일부터 청년부에서 성경 통독을 시작해보세요!',
                  style: TextStyle(color: Colors.grey, fontSize: 12),),
                  Text('수민님, 성경통독반은 어떠세요?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  Align(
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.9*0.5,
                      height: 45,
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        color: Color(0xffaaede4),
                        borderRadius: BorderRadius.circular(30)
                      ),
                      alignment: Alignment.center,
                      child: Text('지금 신청하기',
                      style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RequestBlock(color: Color(0xfffff2cc),text: '예배',),
                RequestBlock(color: Color(0xfffce5cd),text: '봉사',),
                RequestBlock(color: Color(0xffd9ead3),text: '교육',),
                RequestBlock(color: Colors.white,text: '면담',),
              ],
            ),
            SizedBox(height: 30,),
            Calendar(),
            SizedBox(height: 20,)
          ],
    );
  }
}

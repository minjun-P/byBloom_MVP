import 'package:flutter/material.dart';
import 'package:bybloom_mvp/schedule/model/calendar_model.dart';
/**
 * 캘린더 내부 정보를 기록할 객체를 하나 만들어서 날짜별로 해당하는 일정을 표시할 수 있도록
 * 만들어놔야 할 것 같다. 구체적인 방식은 더 고민을 해보자.
 *
 * 잠깐 생각한 건데, json 처럼 형태를 구성해도 좋을 것 같다.
 * 최상위 계층 key는 날짜,
 * 그다음은 날짜별 일정, 일정은 또 교회 공식일정, 개인신청일정으로 나누고
 */

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),

        child: Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(child: Center(child: Text('일',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),), height: 50,),
                    Container(child: Center(child: Text('월',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)), height: 50,),
                    Container(child: Center(child: Text('화',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)), height: 50,),
                    Container(child: Center(child: Text('수',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)), height: 50,),
                    Container(child: Center(child: Text('목',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)), height: 50,),
                    Container(child: Center(child: Text('금',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)), height: 50,),
                    Container(child: Center(child: Text('토',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)), height: 50,),
                  ]
              ),
              Table(
                border: TableBorder(
                    top: BorderSide(width: 2, color: Colors.grey[300]!,),
                    horizontalInside: BorderSide(width: 2,color: Colors.grey[300]!),
                    verticalInside: BorderSide(width: 2, color: Colors.grey[300]!)),
                children: [
                  TableRow(
                      children:
                      List.generate(7,(index) {
                        return TableCell(
                          child: Container(
                            height: 100,
                            child: Column(
                              children: [
                                Align(
                                    alignment: Alignment(-0.8,-0.8),
                                    child: Text('${index+2}')
                                ),

                                _officialScheduleBuilder(OfficialMap,index+2),
                                _personalScheduleBuilder(PersonalMap,index+2)
                              ],

                            ),
                          ),
                        );
                      })

                  ),
                  TableRow(
                      children:
                      List.generate(7,(index) {
                        return TableCell(
                          child: Container(
                            height: 100,
                            child: Column(
                              children: [
                                Align(
                                    alignment: Alignment(-0.8,-0.8),
                                    child: Text('${index+9}')
                                ),

                                _officialScheduleBuilder(OfficialMap,index+9),
                                _personalScheduleBuilder(PersonalMap,index+9)
                              ],

                            ),
                          ),
                        );
                      })

                  ),

                ],
              ),
            ]
        )
    );
  }

  _officialScheduleBuilder(Map schedule,int index) {

    if (schedule.containsKey(index.toString())) {
      return Container(
        height:20,
        width: (MediaQuery.of(context).size.width*0.9-20)/7-2,
        margin: EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10)
        ),
        alignment: Alignment.center,
        child: Text(schedule[index.toString()],style: TextStyle(fontSize: 7),),
      );

    } else {
      return Container(
        height: 0,
      );
    }
  }
  _personalScheduleBuilder(Map schedule,int index) {

    if (schedule.containsKey(index.toString())) {
      return Container(
        height: 20,
        width: (MediaQuery.of(context).size.width*0.9-20)/7-2,
        margin: EdgeInsets.symmetric(horizontal: 4,vertical: 3),
        decoration: BoxDecoration(
            color: index%2==0?Colors.cyan:Colors.yellow,
            borderRadius: BorderRadius.circular(5)
        ),
        alignment: Alignment.center,
        child: Text(schedule[index.toString()],style: TextStyle(fontSize: 7),),
      );

    } else {
      return Container(
        height: 0,
      );
    }
  }
}

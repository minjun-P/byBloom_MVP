import 'package:flutter/material.dart';


class NoticeBoard extends StatefulWidget {
  const NoticeBoard({Key? key}) : super(key: key);

  @override
  _NoticeBoardState createState() => _NoticeBoardState();
}

class _NoticeBoardState extends State<NoticeBoard> {
  final optionList = ['최신순','조회순','좋아요순'];
  String selectedOption = '최신순';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '공지사항',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
               DropdownButton(
                 isDense: true,
                  itemHeight: null,
                  elevation: 2,
                  iconSize: 20,
                  value: selectedOption,
                    items: List.generate(
                      optionList.length,
                        (index) {
                        return DropdownMenuItem(
                            child: Text(optionList[index],style: TextStyle(fontSize: 12),),
                            value: optionList[index],
                        );
                        }
                    ),
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        selectedOption = value.toString();
                      });
                }),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            child: Text(
              'ST 기도회를 다시 시작합니다.'
                  '\n매일 오전 11:30 시민의 교회 유튜브 채널에서 방송합니다.',
              style: TextStyle(color: Colors.grey),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10,),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            child: Text(
              'ST 기도회를 다시 시작합니다.'
                  '\n매일 오전 11:30 시민의 교회 유튜브 채널에서 방송합니다.',
              style: TextStyle(color: Colors.grey),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}







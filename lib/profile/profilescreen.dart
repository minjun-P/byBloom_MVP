import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15,),
        Row(
          children: [
             CircleAvatar(
                backgroundImage:NetworkImage('https://file.mk.co.kr/meet/neds/2018/06/image_readtop_2018_363950_15284412663345335.jpg'),
                radius:60,
             ),
            SizedBox(width: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('게시물 25',style: TextStyle(color: Colors.grey, fontSize: 18),),
                SizedBox(height: 5,),
                Text('매일 성경필사 도전중!',style: TextStyle(color: Colors.grey)),
                Text('시민의교회 소속',style: TextStyle(color: Colors.grey))
              ],
            )
          ],
        ),
        SizedBox(height: 15,),
        Expanded(
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 42,
              itemBuilder: (BuildContext context, int index) {
                return Image.network(
                    "https://picsum.photos/id/${index+1}/200/200"
                );
              } ),
        ),

        Container(color: Colors.red,)
      ],
    );
  }
}

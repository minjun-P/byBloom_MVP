import 'package:flutter/material.dart';

class RequestBlock extends StatelessWidget {
  final String text;
  final Color color;
  const RequestBlock({Key? key, required this. color, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15,horizontal: MediaQuery.of(context).size.width/20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[300]!, width: 2),
      ),
      child: Center(
        child: Column(
          children: [
            Text(text,style: TextStyle(fontSize: MediaQuery.of(context).size.width/21-1,color: Colors.grey),),
            Text('신청',style: TextStyle(fontSize: MediaQuery.of(context).size.width/21-1,color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

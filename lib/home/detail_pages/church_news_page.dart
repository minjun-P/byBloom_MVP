import 'package:flutter/material.dart';

class ChurchNewsPage extends StatelessWidget {
  const ChurchNewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('공지사항'),
        backgroundColor: Color(0xFFf1f8f7),
        elevation: 0,
      ),
      body: Center(child: Text('ChurchNewsPage'),),
    );
  }
}
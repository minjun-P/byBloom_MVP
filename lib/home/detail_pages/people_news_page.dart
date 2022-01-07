import 'package:flutter/material.dart';

class PeopleNewsPage extends StatelessWidget {
  const PeopleNewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('공지사항'),),
      body: Center(child: Text('PeopleNewsPage'),),
    );
  }
}
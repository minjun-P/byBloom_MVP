import 'package:flutter/material.dart';
import 'package:bybloom_mvp/constants.dart';

class NoticePage extends StatelessWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: MColor,
        ),
        child: DataTable(
          columns: [
            DataColumn(
              numeric: true,
              label: Text('연번',)
            ),
            DataColumn(
                label: Text('제목',)
            ),
            DataColumn(
                label: Text('날짜',)
            ),
          ],
          rows: [
            DataRow(
              cells: [
                DataCell(
                  Text('1')
                ),
                DataCell(
                    Text('ST 기도회를 다시 시작합니다.')
                ),
                DataCell(
                    Text('2022/01/05')
                )
              ]
            ),
            DataRow(
                cells: [
                  DataCell(
                      Text('2')
                  ),
                  DataCell(
                      Text('새생명 축제가 3주 앞으로 다가왔습니다')
                  ),
                  DataCell(
                      Text('2022/01/07')
                  )
                ]
            ),
            DataRow(
                cells: [
                  DataCell(
                      Text('2')
                  ),
                  DataCell(
                      Text('새생명 축제가 3주 앞으로 다가왔습니다')
                  ),
                  DataCell(
                      Text('2022/01/07')
                  )
                ]
            )
          ],
        ),
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestController {
  var subtitle = '내일부터 청년부에서 성경 통독을 시작해보세요!'.obs;
  var title = '수민님, 성경통독반은 어떠세요?'.obs;
}

class CalendarController {
  var OfficialMap = {
    '2':['신년주일예배'],
    '5':['수요예배'],
    '7':['금요예배'],
    '9':['주일예배'],
    '12':['수요예배'],
    '14':['금요예배']
  }.obs;
  var PersonalMap = {
  '5':['청소봉사'],
  '7':['마더와이즈','치킨모임'],
  '8':['어와나'],
  '14':['마더와이즈'],
  '15':['어와나']
  }.obs;
  void update(index) {
    if (PersonalMap.containsKey(index.toString())) {
      PersonalMap[index.toString()]!.add('치킨ㄱ?');

    } else {
      PersonalMap[index.toString()] = ['치킨ㄱ?'];
    }
  }
}
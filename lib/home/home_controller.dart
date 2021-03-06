import 'package:get/get.dart';
import 'package:flutter/material.dart';



class NoticeController {
  var board1 = <String,String>{'title':'ST기도회를 다시 시작합니다.','content':'매일 오전 11:30 시민의 교회 유튜브 채널에서 방송합니다'}.obs;
  var board2 = <String,String>{'title':'새새명 축제가 3주 앞으로 다가왔습니다.','content':'교회 로비에 비치된 새신자 카드를 확인해주세요'}.obs;

  void change() {
    board2['title'] = '새생명 축제가 1주 앞입니다';
  }
  void changeBack() {
    board2['title'] = '새새명 축제가 3주 앞으로 다가왔습니다.';
  }

  var dropdownValue = '최신순'.obs;
  void dropdownValueChange(value) {
    dropdownValue(value);
  }
}
enum DropDownMenu {LATE, MANY, POPULAR}

extension DropDownMenumExtension on DropDownMenu {
  String get name {
    switch (this) {
      case DropDownMenu.LATE:
        return '최신순';
      case DropDownMenu.MANY:
        return '조회순';
      case DropDownMenu.POPULAR:
        return '인기순';
    }
  }
}

class DropDownController {
  Rx<DropDownMenu> currentValue = DropDownMenu.LATE.obs;
  final dropKey = GlobalKey();

  void chageDropDownMenu(value) {
    currentValue(value);
  }

  double get positionY {
    var box = dropKey.currentContext!.findRenderObject();
    var translation = box!.getTransformTo(null).getTranslation();
    return box.paintBounds.shift(Offset(translation.x,translation.y)).bottomCenter.dy;
  }
  double get positionX {
    var box = dropKey.currentContext!.findRenderObject();
    var translation = box!.getTransformTo(null).getTranslation();
    return box.paintBounds.shift(Offset(translation.x,translation.y)).bottomLeft.dx;
  }
}


class PeopleNewsController {
  var board1 = <String,String>{'title':'김정한 장로님의 손자인 김태인 청년의 결혼식입니다.','content':'12/23 오후 2시 신세계 컨벤션홀에서 열립니다.','url':'https://postfiles.pstatic.net/MjAyMTEwMjdfMTk4/MDAxNjM1MzQwMjYwMjE1.NM91425fGOCAGAVsGSk84i66w1PVrWWc6YFPvllJiNQg.OwfgrLWEVmaed1hnHZoCaP7VyNS4rKnRWQcsrORiyX0g.JPEG.speakerhong/IMG_8675.JPG?type=w580'}.obs;
  var board2 = <String,String>{'title':'교역자 부임 안내입니다','content':'이영한 전도사님이 오늘부로 부임하셨습니다.','url':'https://i.pinimg.com/564x/97/d7/33/97d733f3cb7c720ca6825b2d4f215e1c.jpg'}.obs;

  void change() {
    board2['url'] = 'https://sm.ign.com/t/ign_kr/screenshot/default/sujeongdoem-ironmanvr-review-blogroll-1593638760998-h1ze1280_9rzv.1280.jpg';
  }
  void changeBack() {
    board2['url'] = 'https://i.pinimg.com/564x/97/d7/33/97d733f3cb7c720ca6825b2d4f215e1c.jpg';
  }
}

class ChurchNewsController {
  var board1 = '부모를 위한 성경적 성 가치관 학교 수강생 모집합니다'.obs;
  var board2 = '교육부 교사 모집합니다'.obs;
  var board3 = <String,dynamic>{
    'title':'사랑의 선물 봉사 사진입니다.',
    'pic':[
      'https://i.pinimg.com/736x/56/5c/85/565c852c7448cc27746fd05e96b2c668.jpg',
      'https://i.pinimg.com/564x/28/98/18/289818a4b0cc26aa39517489e85e1e07.jpg',
      'https://i.pinimg.com/736x/72/66/40/72664053608151360bd2392c4a43587f.jpg'
    ]
  }.obs;
}
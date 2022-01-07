
import 'package:get/get.dart';

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
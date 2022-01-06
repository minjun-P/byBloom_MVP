class OfficialCalendar {
  int day;
  String title;

  OfficialCalendar({required this.day, required this.title});
}

List OfficialList = [
  OfficialCalendar(day: 2, title: '신년주일예배'),
  OfficialCalendar(day: 5, title: '수요예배'),
  OfficialCalendar(day: 7, title: '금요예배'),
  OfficialCalendar(day: 9, title: '주일예배'),
  OfficialCalendar(day: 12, title: '수요예배'),
  OfficialCalendar(day: 14, title: '금요예배'),

];

Map OfficialMap = {
  '2':'신년주일예배',
  '5':'수요예배',
  '7':'금요예배',
  '9':'주일예배',
  '12':'수요예배',
  '14':'금요예배'
};

Map PersonalMap = {
  '5':'청소봉사',
  '7':'마더와이즈',
  '8':'어와나',
  '14':'마더와이즈',
  '15':'어와나'
};
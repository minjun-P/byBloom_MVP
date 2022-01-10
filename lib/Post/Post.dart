class Post{
  String? key;
  String? downloadURL;
  String? URL;
  String? dbref;

  Post(this.downloadURL,this.URL);

  toJSON(){
    return{
      'downloadURL':downloadURL,
      'URL':URL
    };
  }


}
import 'dart:io';
import 'package:bybloom_mvp/Auth/authservice.dart';
import 'package:bybloom_mvp/Post/Postpage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bybloom_mvp/Post/Post.dart';
import 'package:get/get.dart';


String? pphotoloc;
User? curuser = authservice.getcurrentUser();
final database= FirebaseDatabase(databaseURL: 'https://bybloommvp-default-rtdb.asia-southeast1.firebasedatabase.app/');
final storage= FirebaseStorage.instance;


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);



  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _photo;
  String? downloadURL;
  List<Post> postlist= new List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    if (curuser!=null){

    }
    String userdir='users/${authservice.getcurrentUser()?.uid}';

    database.ref('$userdir/post').onChildAdded.listen((event) {
      print(event.snapshot.value.toString());
      final data =Map<String,dynamic>.from(event.snapshot.value as Map);
      if(mounted){setState(() {
        Post s=Post(data['downloadURL'],data['URL']);
        s.key=event.snapshot.key;
        postlist.add(s);
        print("postadded");
      });
    }});
    }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Column(
      children: [
        SizedBox(height: 15,),
        Row(
          children: [
            InkWell(
              child: CircleAvatar(
                backgroundImage:downloadURL==null?
                NetworkImage('https://file.mk.co.kr/meet/neds/2018/06/image_readtop_2018_363950_15284412663345335.jpg'):
                NetworkImage(downloadURL!,scale:3),

                radius: 60,
              ),
              onLongPress: () {
                showDialog(context: context,
                    builder: (context) {
                      return AlertDialog(

                        elevation: MediaQuery
                            .of(context)
                            .size
                            .height / 5,
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('프로필변경')
                          ],
                        ),
                        actions: <Widget>[
                          TextButton(onPressed: () {
                            AddProfilePhoto();
                            setState(() {

                            });
                            Navigator.pop(context);
                          }, child: Text('예')),
                          TextButton(onPressed: () {
                            Navigator.pop(context);
                          }, child: Text('아니오'))
                        ],
                      );
                    });
              }
              ,
            ),
            SizedBox(width: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('게시물 25',
                  style: TextStyle(color: Colors.grey, fontSize: 18),),
                SizedBox(height: 5,),
                Text('매일 성경필사 도전중!', style: TextStyle(color: Colors.grey)),
                Text('시민의교회 소속', style: TextStyle(color: Colors.grey))
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
              itemCount: postlist.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child:GridTile(
                    child: InkWell(
                      child:Image.network(postlist[index].downloadURL!),
                      onTap: (){Get.to(PostViewPage(),arguments: postlist);},
                    )
                  )
                );
              }),
        ),

        Container(color: Colors.red,)
      ],
    ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        AddPhotoPost();
      },
      child: Icon(Icons.add_a_photo),

      ),
    );
  }

  AddProfilePhoto() async {
    await getImage(true);  //갤러리에서 사진가져오기
    Addphoto s= new Addphoto();
    print(_photo);
    String? uploadsuccess= await s.uploadPhoto(_photo); //db에 업로드
    downloadURL= await storage.ref(uploadsuccess).getDownloadURL();
    print('downloadURL');

  }
  AddPhotoPost() async {
    await getImage(true);  //갤러리에서 사진가져오기
    Addphoto s= new Addphoto();
    print(_photo);
    String? uploadsuccess= await s.uploadPost(_photo); //db에 업로드
    downloadURL= uploadsuccess;
    print('downloadURL');
  }


  Future getImage(bool gallery) async {

    ImagePicker picker = ImagePicker();
    XFile? pickedFile;
    // Let user select photo from gallery
    if (gallery) {
      pickedFile = await picker.pickImage(
          source: ImageSource.gallery);
    }
    // Otherwise open camera to get new photo
    else {
      pickedFile = await picker.pickImage(
        source: ImageSource.camera,);
    }
    setState(() {
      if (pickedFile != null) {
        _photo =
            File(pickedFile.path); // Use if you only need a single picture
      } else {
        print('No image selected.');
      }
    });
  }

}

class Addphoto {
  User? curuser = authservice.getcurrentUser();
  String userdir = 'users/${authservice
      .getcurrentUser()
      ?.uid}';

  Future<String?> uploadPhoto(File? s) async {
    try {

      await storage
          .ref('$userdir/profilephoto.png')
          .putFile(s!);
      return '$userdir/profilephoto.png';
    } on FirebaseException catch (e) {
      print(e);
      return null;
    }
  }
  Future<String?> uploadPost(File? s) async {
    try {
     DatabaseReference dbref= await database.ref(userdir).child('post').push();
     print(dbref.toString());
     String? postkey=dbref.key;
     await storage
          .ref('$userdir/post/$postkey.png')
          .putFile(s!);
     String url='$userdir/post/$postkey.png';
     String downloadURL= await storage.ref(url).getDownloadURL();
     dbref.set({"URL":url,
     "downloadURL":downloadURL});
     return downloadURL;
    } on FirebaseException catch (e) {
      print(e);
      return null;
    }
  }

}


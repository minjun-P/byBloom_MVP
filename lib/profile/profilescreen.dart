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
import 'package:extended_image/extended_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                ExtendedNetworkImageProvider('https://file.mk.co.kr/meet/neds/2018/06/image_readtop_2018_363950_15284412663345335.jpg'):
                ExtendedNetworkImageProvider(downloadURL!,cache: true,scale:1),

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
                            Text('???????????????')
                          ],
                        ),
                        actions: <Widget>[
                          TextButton(onPressed: () {
                            AddProfilePhoto();
                            setState(() {

                            });
                            Navigator.pop(context);
                          }, child: Text('???')),
                          TextButton(onPressed: () {
                            Navigator.pop(context);
                          }, child: Text('?????????'))
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
                Text('????????? ${postlist.length}',
                  style: TextStyle(color: Colors.grey, fontSize: 18),),
                SizedBox(height: 5,),
                Text('?????? ???????????? ?????????!', style: TextStyle(color: Colors.grey)),
                Text('??????????????? ??????', style: TextStyle(color: Colors.grey))
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
                      child:ExtendedImage.network(postlist[index].downloadURL!,cache: true,width: 100.w,height: 100.w,),
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
    await getImage(true);  //??????????????? ??????????????????
    Addphoto s= new Addphoto();
    print(_photo);
    String? uploadsuccess= await s.uploadPhoto(_photo); //db??? ?????????
    downloadURL= await storage.ref(uploadsuccess).getDownloadURL();
    print('downloadURL');

  }
  AddPhotoPost() async {
    await getImage(true);  //??????????????? ??????????????????
    Addphoto s= new Addphoto();
    print(_photo);
    String? uploadsuccess= await s.uploadPost(_photo); //db??? ?????????
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


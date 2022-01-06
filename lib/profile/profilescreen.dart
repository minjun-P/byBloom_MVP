import 'dart:io';

import 'package:bybloom_mvp/Auth/authservice.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';


String? pphotoloc;
final database= FirebaseDatabase.instance;
final storage= FirebaseStorage.instance;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);



  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _photo;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15,),
        Row(
          children: [
            InkWell(
              child: CircleAvatar(
                backgroundImage:
    NetworkImage('https://file.mk.co.kr/meet/neds/2018/06/image_readtop_2018_363950_15284412663345335.jpg'),
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
              itemCount: 42,
              itemBuilder: (BuildContext context, int index) {
                return Image.network(
                    "https://picsum.photos/id/${index + 1}/200/200"
                );
              }),
        ),

        Container(color: Colors.red,)
      ],
    );
  }

  AddProfilePhoto() {
    getImage(true);
    profilephoto.uploadPhoto(_photo);
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

class profilephoto {
  User? curuser = authservice.getcurrentUser();
  String userdir = 'users/${authservice
      .getcurrentUser()
      ?.uid}';

  uploadPhoto(File? s) async {
    try {
      await storage
          .ref('$userdir/profilephoto.png')
          //.putFile(s);
    } on FirebaseException catch (e) {};
  }
}
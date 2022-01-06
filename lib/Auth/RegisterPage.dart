import 'authservice.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
Map<String,dynamic>? s={'아이디':'','비밀번호':'','닉네임':'','비밀번호확인':''};

class RegisterPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_RegisterPage();
}

class _RegisterPage extends State<RegisterPage>{


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(40),
            child: ListView(
              children: [
                Text('회원가입', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),
                RegisterForm()
              ],
            )
        )
    );

  }
}
class CustomTextField extends StatelessWidget {
  final String type;

  const CustomTextField({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: TextFormField(
          cursorColor: Colors.black,
          decoration: InputDecoration(
              labelText: type,
              labelStyle: TextStyle(color: Colors.black),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
              )
          ),
          validator: (value) => value!.isEmpty?'$type이 입력되지 않았습니다':null,
          obscureText: type=='비밀번호' || type=='비밀번호 확인'?true:false,
          onSaved:(value){ s![type]=value;}

      ),
    );
  }
}
class RegisterForm extends StatelessWidget {
  RegisterForm({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(type: '아이디'),
          CustomTextField(type: '비밀번호'),
          CustomTextField(type: '비밀번호 확인'),
          CustomTextField(type: '닉네임'),
          SizedBox(height: 10,),
          TextButton(
            onPressed: () async {
              if(_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                User? suc= await authservice.register(s!['아이디'],s!['비밀번호'],s!['닉네임']);

                if(suc!=null){
                  Navigator.pushNamed(context, '/Main');
                }

              }
            }
            ,
            child: Container(
              height: 50,
              width: 200,
              child: Text('등록', style: TextStyle(color: Colors.white, fontSize: 20),),
              alignment: Alignment(0,0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black
              ),

            ),

          )
        ],
      ),
    );
  }
}

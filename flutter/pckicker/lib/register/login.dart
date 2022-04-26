import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pckicker/register/signup.dart';
import 'package:pckicker/feed/feed.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pckicker/register/signup.dart';

import '../feed/feed.dart';

class LoginPage extends StatelessWidget {
  LoginPage({ Key? key }) : super(key: key);
final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
 final _formKey = GlobalKey<FormState>();
 var _email = TextEditingController();
 var _password = TextEditingController();
var _display = TextEditingController();

var _displayname;
var _role;
bool _buttonvisible = false;


  get displayName => _displayname;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Color.fromARGB(255, 90, 209, 245),

   appBar: AppBar(centerTitle: true,backgroundColor: Color.fromARGB(255, 0, 38, 255),title: Text("POLITICKER"),),
      body: Center( 
      child: Form(key: _formKey, child: Column(children: [
        /*
        Text("Display Name"),
TextFormField(controller: _display,
validator: (String? value){
  onSaved: (value){
  _display.text =  value!;
  };
}),
*/
Text("Email"),
TextFormField(controller: _email, onSaved: (value){
  _email.text =  value!;
  })
,SizedBox(height: 40)
,
Text("Password"),
TextFormField(controller: _password,
obscureText: true,
validator: (String? value){
  if(value!.isEmpty){

    ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text("Empty Password")));
    return ("Empty Password");
  }else if(value.length < 8){
    ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text("Your password must be longer than 8 characters")));
    return ("Your password must be longer than 8 characters");
  }
  return null;
},
onSaved: (value){
  _password.text =  value!;
}
),SizedBox(height: 40)
,
ElevatedButton(onPressed: (){

  signIn(context, _email.text, _password.text);

}, child: const Text("Enter")),SizedBox(height: 40)
,
ElevatedButton(onPressed: (){
Navigator.push(context, MaterialPageRoute(builder:(context) =>  signuppage()));

}, child: const Text("Register")),
TextButton(onPressed: (){ 
_handleSignIn();
  checkrole(context);
}, child: const Text("Sign in with Google"))
      ],)
      
      
      
      ,)
    )
    );
  }
   void signIn(BuildContext context, String email, String password) async {
    if(_formKey.currentState!.validate()){
      await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((uid) => {
               checkrole(context),
                
               
                ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text("Login Successful"))),
 //print(_buttonvisible.toString()),
                
               
        }).catchError((e){
          ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text("Login Unsuccessful")));

        }
        );
    }


  }
  checkrole(BuildContext context) async{
    final firebaseuser = await FirebaseAuth.instance.currentUser!;
     Navigator.push(context, MaterialPageRoute(builder:(context) => RealFeed()));
  
}

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);
Future<void> _handleSignIn() async {
    User user;
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth =
    await googleUser?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth!.idToken);

    final UserCredential authResult = await _auth.signInWithCredential(credential);
    user = authResult.user!;

    if (authResult.additionalUserInfo!.isNewUser){
          try{
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set(
        {'id': user.uid, 'display_name': user.displayName, 'email': user.email, 'role': "USER"});
      await FirebaseFirestore.instance
      .collection("ratings")
      .doc(user.uid)
      .set({
        "rating": -1000
      });
    } on FirebaseException catch (e){
      print(e);
  }
}
  
}



}
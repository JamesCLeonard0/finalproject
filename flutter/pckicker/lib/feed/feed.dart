
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pckicker/feed/resource.dart';
import 'package:flutter/rendering.dart';
import 'package:pckicker/feed/politickers.dart';
import 'package:pckicker/register/login.dart';
import 'package:pckicker/feed/questions.dart';

class RealFeed extends StatelessWidget {
   RealFeed({ Key? key}) : super(key: key);
//final _content = TextEditingController();
  @override
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection("users");
    CollectionReference ratings = FirebaseFirestore.instance.collection("ratings");
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var s;
  var myRating;
  var space;
  dynamic displayName;
  dynamic buttonvisible;



  Widget build(BuildContext context) {

    return Scaffold(
              backgroundColor: Color.fromARGB(255, 90, 209, 245),

   appBar: AppBar(centerTitle: true,backgroundColor: Color.fromARGB(255, 0, 38, 255),title: Text("POLITICKER"),),
 body: Container( alignment: Alignment.topCenter,child: FutureBuilder(future: _fetch(),builder: (context, snapshot) {
   if(snapshot.connectionState != ConnectionState.done){
    return Text("loading");
   }else if(myRating == -1000){
       Navigator.push(context, MaterialPageRoute(builder:(context) => Questions()));
    return SizedBox();
    }else{
       if(myRating > 0){
         s = "Policy Score: " + myRating.toString() + " Rank: Conservative";
         }else if(myRating < 0){
         s = "Policy Score: " + (-myRating).toString() + " Rank: Liberal";

        }else{
         s = "Policy Score: " + myRating.toString() + " Rank: Centrist";
  
        }
             Navigator.push(context, MaterialPageRoute(builder:(context) => Politickers()));
      
      return  SizedBox(); 
     
   }

 
 
 }),
 
 
 )

    );
  }


_fetch() async{
  final firebaseUser = await FirebaseAuth.instance.currentUser;
  if(firebaseUser != null){
    await FirebaseFirestore.instance
      .collection('ratings')
      .doc(firebaseUser.uid)
      .get()
      .then((ds){
  myRating = ds.get('rating');
      }).catchError((e){
        print(e);
      });
  if(myRating != -1000){
    myRating = 0;
        await FirebaseFirestore.instance
         .collection('questions')
          .doc(firebaseUser.uid)
          .get()
      .then((ds){ 
        if(ds.get(questions().elementAt(0).question.toString()) == "Yes"){
         myRating += -10;
        }else if(ds.get(questions().elementAt(0).question.toString()) == "No"){
          myRating += 10;
        }
         if(ds.get(questions().elementAt(1).question.toString()) == "Yes"){
myRating += -10;
        }else if(ds.get(questions().elementAt(1).question.toString()) == "No"){
myRating += 10;
        }
         if(ds.get(questions().elementAt(2).question.toString()) == "Yes"){
myRating += -10;
        }else if(ds.get(questions().elementAt(2).question.toString()) == "No"){
myRating += 10;
        }
         if(ds.get(questions().elementAt(3).question.toString()) == "Yes"){
myRating += -10;
        }else if(ds.get(questions().elementAt(3).question.toString()) == "No"){
myRating += 10;
        }
         if(ds.get(questions().elementAt(4).question.toString()) == "Yes"){
myRating += 10;
        }else if(ds.get(questions().elementAt(4).question.toString()) == "No"){
myRating += -10;
        }
         if(ds.get(questions().elementAt(5).question.toString()) == "Yes"){
myRating += 10;
        }else if(ds.get(questions().elementAt(5).question.toString()) == "No"){
myRating += -10;
        }
         if(ds.get(questions().elementAt(6).question.toString()) == "Yes"){
myRating += -10;
        }else if(ds.get(questions().elementAt(6).question.toString()) == "No"){
myRating += 10;
        }
         if(ds.get(questions().elementAt(7).question.toString()) == "Yes"){
myRating += 10;
        }else if(ds.get(questions().elementAt(7).question.toString()) == "No"){
myRating += -10;
        }
         if(ds.get(questions().elementAt(8).question.toString()) == "Yes"){
myRating += 10;
        }else if(ds.get(questions().elementAt(8).question.toString()) == "No"){
myRating += -10;
        }
         if(ds.get(questions().elementAt(9).question.toString()) == "Yes"){
myRating += 10;
        }else if(ds.get(questions().elementAt(9).question.toString()) == "No"){
myRating += -10;
        }
        FirebaseFirestore.instance
                        .collection('ratings')
                        .doc(_auth.currentUser!.uid)
                        .set({  "rating": myRating});

   }).catchError((e){
        print(e);
      });
      }  
         FirebaseFirestore.instance
                        .collection('ratings')
                        .doc(_auth.currentUser!.uid)
                        .set({  "rating": myRating,
           "displayName": _auth.currentUser!.displayName});
 
  }


}
}



/*body: StreamBuilder(stream: users.snapshots(), 
builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
       
        if(!snapshot.hasData){
              
          return const Text("No Data");
     
        }
        if(users.doc(_auth.currentUser!.uid).id == _auth.currentUser!.uid){
         
          return FutureBuilder(future: _fetch(),
          builder: (context, snapshot){

          }
          
          
          
          );
         
        }
        return Column(children: [
        Text(users.doc(_auth.currentUser!.uid).id.toString()  ),
         Text(_auth.currentUser!.uid.toString())

        ]);

    
       })
       */
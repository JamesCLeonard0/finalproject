import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pckicker/register/signup.dart';
class Politickers extends StatelessWidget {


  Politickers({ Key? key}) : super(key: key);
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    CollectionReference ratings = FirebaseFirestore.instance.collection("ratings");
    var displayname = "User";
    var usern = -2;
    var sname = "";
    List<String> username = [];
    copy(){
  usern += 1;
  print(usern);
  if(usern >= username.length){
    return username.elementAt(username.length-1);
  }else if(usern < 0){
    return username.elementAt(0);
  }
  return username.elementAt(usern);
  
}

communist() async{

  FirebaseFirestore.instance.collection('users').get().then((snapshot) => {
    snapshot.docs.forEach((doc) {
        username.add(doc.get('display_name'));
    })
});
}
checkrating(int myRating){
   var s;
   if(myRating != -1000){
 if(myRating > 0){
  
         s = "Policy Score: " + myRating.toString() + " Rank: Conservative";
         }else if(myRating < 0){
         s = "Policy Score: " + (-myRating).toString() + " Rank: Liberal";

        }else{
         s = "Policy Score: " + myRating.toString() + " Rank: Centrist";
  
        }
        return s;
   }
   return " does not have survey filled";
}
  @override
  Widget build(BuildContext context) {
      return Scaffold(
            backgroundColor: Color.fromARGB(255, 90, 209, 245),

   appBar: AppBar(centerTitle: true,backgroundColor: Color.fromARGB(255, 0, 38, 255),title: Text("POLITICKER"),),
      body: FutureBuilder(future: communist(),builder: (context, snapshot){
         if(snapshot.connectionState != ConnectionState.done){
    return Text("loading");
   }else {
     //print(username.toString());

 
       return StreamBuilder(stream: ratings.snapshots(), 
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
       
        if(!snapshot.hasData){
              
          return const Text("No Data");
     
        }
       return ListView(
          
          children: snapshot.data!.docs.map((document){
    

            return Column(
              children:[
           
              Text(copy(), style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold), 
            ),
           SizedBox(height: 15),


            Text(checkrating(document['rating']).toString(),
            style: TextStyle(fontSize: 15)
            ),SizedBox(height: 20),
          
          ],
            );
            

          }).toList(),
      );
        
      //  ]);
 
    });
       }
      }
    ),
    bottomNavigationBar: BottomNavigationBar(items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
            icon: Icon(Icons.arrow_left),
            label: 'Logout',
            
          ),
  BottomNavigationBarItem(
            icon: Icon(Icons.stop),
            label: 'Stay',
            
          ),
   ],
        selectedItemColor: Colors.amber[800],
        onTap: (index){
          if(index == 0){
           Navigator.pop(context);

          Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);
          }else{
  Navigator.push(context, MaterialPageRoute(builder:(context) => signuppage()));
          }
        })
    );
    
  }
  }
  



  /*
  checkrole(BuildContext context) async{
    final firebaseuser = await FirebaseAuth.instance.currentUser!;
  if(firebaseuser != null){
    await FirebaseFirestore.instance
    .collection('users')
    .doc(firebaseuser.uid)
    .get()
    .then((ds){
    displayname = ds.get('display_name');
       } ).catchError((e){
        print(e);

    });
  }
  return Text( displayname, style: TextStyle(fontSize: 25));
  }

  _faint(var id) async{
  final firebaseUser = await FirebaseAuth.instance.currentUser;
  var space;
  if(firebaseUser != null){
    await FirebaseFirestore.instance
      .collection('users')
      .doc(id)
      .get()
      .then((ds){
space = ds.get('display_name');
      }).catchError((e){
        print(e);
      });
}
return space;
}
*/


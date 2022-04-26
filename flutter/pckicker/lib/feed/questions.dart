
import 'package:flutter/material.dart';
import 'package:conditional_questions/conditional_questions.dart';
import 'package:pckicker/feed/feed.dart';
import 'package:pckicker/feed/resource.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pckicker/feed/politickers.dart';


class Questions extends StatefulWidget {
  const Questions({ Key? key }) : super(key: key);

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
    final _key = GlobalKey<QuestionFormState>();
    final FirebaseAuth _auth =  FirebaseAuth.instance;
     late final _firestream = FirebaseFirestore.instance.collection('questions').doc(_auth.currentUser!.uid).get(); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
               backgroundColor: const Color.fromARGB(255, 90, 209, 245),

   appBar: AppBar(centerTitle: true,backgroundColor: const Color.fromARGB(255, 0, 38, 255),title: const Text("POLITICKER"),),
  // ignore: avoid_print
 body: FutureBuilder<DocumentSnapshot>(
        future: _firestream,
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          return ConditionalQuestions(
            key: _key,
            children: questions(),
            value: snapshot.data!.data(),
            trailing: [
              MaterialButton(
                color: Colors.deepOrange,
                splashColor: Colors.orangeAccent,
                onPressed: () async {
                  if (_key.currentState!.validate()) {
                    FirebaseFirestore.instance
                        .collection('questions')
                        .doc(_auth.currentUser!.uid)
                        .set(_key.currentState!.toMap());
                    FirebaseFirestore.instance
                        .collection('ratings')
                        .doc(_auth.currentUser!.uid)
                        .set({"rating": 0});
                    Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);
                  }
                    Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);
                      },
                child: Text("Submit"),
              )
            ],
            leading: [Text("POLITICAL SURVEY")],
      );
        })
        );

}
}


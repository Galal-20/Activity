import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class GetUsersData extends StatelessWidget {
  const GetUsersData({super.key, required this.docID});

  final String docID;

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder(
        future: users.doc(docID).get(),
        builder: ((context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text(
                "full name: ${data['full name']}\n"
                    "user name: ${data['user name']}\n"
                    "email: ${data['email']}\n"
            );
          }
          return const Text("loading");
        })
    );
  }
}

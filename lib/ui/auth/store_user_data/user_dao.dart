import 'package:activity/ui/auth/store_user_data/model/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDao{


  static CollectionReference<Users>getUsersCollection(){
    var dp = FirebaseFirestore.instance;
    return dp.collection('Users').withConverter(
        fromFirestore: (snapshot, options) =>
        Users.fromFireStore(snapshot.data()),
    toFirestore: (user, options) => user.toFireStore(),);
  }
  static Future<void> addUser(Users users){
    var userCollection = getUsersCollection();
    var doc = userCollection.doc(users.id);
    return doc.set(users);
  }

  static Future<Users?> getUsers(String userId)async{
    var userCollection = getUsersCollection();
    var doc = userCollection.doc(userId);
    var docSnapshot = await doc.get();
    return docSnapshot.data();
  }

}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gkdnt/models/user_model.dart';
import 'package:gkdnt/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  // collection reference
  final CollectionReference userCollection = FirebaseFirestore.instance
      .collection('users');

  Future updateUserData(
    String name,
    String milkTeaType,
    List<String> toppings,
  ) async {
    return await userCollection.doc(uid).set({
      'name': name,
      'milkTeaType': milkTeaType,
      'toppings': toppings,
    });
  }

  // user list from snapshot
  List<UserModel> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return UserModel(
        name: data['name'] ?? '',
        milkTeaType: data['milkTeaType'] ?? '',
        toppings: List<String>.from(data['toppings'] ?? []),
      );
    }).toList();
  }

  // user data from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return UserData(
      uid: uid,
      name: data['name'],
      milkTeaType: data['milkTeaType'],
      toppings: List<String>.from(data['toppings'] ?? []),
    );
  }

  // get user stream
  Stream<List<UserModel>> get users {
    return userCollection.snapshots().map(_userListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return userCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}

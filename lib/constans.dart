import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GlobalVariables {
  GlobalVariables();
  static User username = FirebaseAuth.instance.currentUser;
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseService{
  FirebaseService();

static FirebaseStorage storage = FirebaseStorage.instance;
static FirebaseFirestore dataBase = FirebaseFirestore.instance;
static FirebaseAuth auth = FirebaseAuth.instance;


}
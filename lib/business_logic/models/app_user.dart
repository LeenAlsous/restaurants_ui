import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser{
  final String name;
  final String username;
  final String email;
  final Timestamp createdOn;

  AppUser({required this.name, required this.username, required this.email, required this.createdOn});

  factory AppUser.fromMap(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options
      ){
    final data = snapshot.data();
    return AppUser(name: data?['name'], username: data?['username'], email: data?['email'], createdOn: data?['createdOn']);
  }

  Map<String, dynamic> toMap(){
    return{
      'name': name,
      'username': username,
      'email': email,
      'createdOn': createdOn
    };
  }
}
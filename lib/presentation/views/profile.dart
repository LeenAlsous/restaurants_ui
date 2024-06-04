import 'package:flutter/material.dart';
import 'package:oop/helper/secure_storage.dart';
import 'package:oop/presentation/views/login.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SecureStorage storage = SecureStorage();
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed:() {storage.deleteData(storage.emailKey); storage.deleteData(storage.passwordKey); pushReplacementWithoutNavBar(context, MaterialPageRoute(builder: (context) => LogIn(),));}, child: const Text('Sign out'),),
      ),
    );
  }
}

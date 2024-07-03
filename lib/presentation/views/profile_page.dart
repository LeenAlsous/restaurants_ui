import 'package:flutter/material.dart';
import 'package:oop/helper/secure_storage.dart';
import 'package:oop/presentation/views/login_page.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SecureStorage storage = SecureStorage();
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed:() {storage.deleteData(storage.emailKey); storage.deleteData(storage.passwordKey); pushReplacementWithoutNavBar(context, MaterialPageRoute(builder: (context) => LogInPage(),));}, child: const Text('Sign out'),),
      ),
    );
  }
}

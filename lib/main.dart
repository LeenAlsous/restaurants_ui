import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oop/firebase_options.dart';
import 'package:oop/helper/secure_storage.dart';
import 'package:oop/presentation/views/bottom_nav_bar.dart';
import 'package:oop/presentation/views/login.dart';
import 'package:sizer/sizer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final SecureStorage secureStorage = SecureStorage();
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: const Color(0xFF823832)),
          home: FutureBuilder<String?>(
            future: secureStorage.readData(secureStorage.emailKey),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return snapshot.hasData && snapshot.data != null
                    ? const BottomNavBar()
                    : LogIn();
              }
            },
          ));
    });
  }
}

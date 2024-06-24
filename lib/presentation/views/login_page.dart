import 'package:flutter/material.dart';
import 'package:oop/business_logic/firebase/firebase_auth.dart';
import 'package:oop/helper/secure_storage.dart';
import 'package:oop/presentation/views/registration_page.dart';
import 'package:oop/presentation/widgets/background.dart';
import 'package:sizer/sizer.dart';

class LogInPage extends StatelessWidget {
  LogInPage({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final SecureStorage secureStorage = SecureStorage();
  final FireAuth fire = FireAuth();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BackgroundImage(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: 15.h),
                Text(
                  'Welcome back!',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp),
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  width: 78.w,
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 2.h),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter email',
                      hintStyle:
                          TextStyle(color: Theme.of(context).primaryColor),
                      focusedBorder: _getBorderStyle(),
                      enabledBorder: _getBorderStyle(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  width: 78.w,
                  child: TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 2.h),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter Password',
                      hintStyle:
                          TextStyle(color: Theme.of(context).primaryColor),
                      focusedBorder: _getBorderStyle(),
                      enabledBorder: _getBorderStyle(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                SizedBox(
                    width: 78.w,
                    height: 5.5.h,
                    child: ElevatedButton(
                      onPressed: () {
                        fire.logInUser(context,
                            email: emailController.text,
                            password: passwordController.text);
                        secureStorage.writeData('email', emailController.text);
                        secureStorage.writeData(
                            'password', passwordController.text);
                        FocusManager.instance.primaryFocus!.unfocus();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.w))),
                      child: Text(
                        'Log in',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegistrationPage()));
                    },
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(color: Color(0xFF73211D)),
                    )),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('Don\'t have an account?',
                      style: TextStyle(fontSize: 12.sp, color: Colors.white)),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistrationPage()));
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(color: Color(0xFF73211D)),
                      )),
                ]),
              ],
            ),
          ),
        )),
      ),
    );
  }

  OutlineInputBorder _getBorderStyle() {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(3.w));
  }
}

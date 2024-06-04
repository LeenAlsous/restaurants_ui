import 'package:flutter/material.dart';
import 'package:oop/business_logic/firebase/firebase_auth.dart';
import 'package:oop/helper/validation_functions.dart';
import 'package:oop/presentation/views/login.dart';
import 'package:oop/presentation/widgets/background.dart';
import 'package:sizer/sizer.dart';

class Registration extends StatelessWidget {
  Registration({Key? key}) : super(key: key);
  final fKey = GlobalKey<FormState>();
  final FireAuth fire = FireAuth();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();


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
            key: fKey,
            child: Column(
              children: [
                SizedBox(height: 4.h),
                Text(
                  'Hello!',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp),
                ),
                SizedBox(height: 4.h),
                SizedBox(
                  width: 78.w,
                  child: TextFormField(
                    validator: (name) {
                      if (name!.isEmpty) {
                        return 'name shouldn\'t be empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 2.h),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter full name',
                      hintStyle: TextStyle(color: Theme.of(context).primaryColor),
                      focusedBorder: _getBorderStyle(),
                      enabledBorder: _getBorderStyle(),
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                SizedBox(
                  width: 78.w,
                  child: TextFormField(
                    validator: (username) {
                      if (username!.isEmpty) {
                        return 'username shouldn\'t be empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 2.h),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter username',
                      hintStyle: TextStyle(color: Theme.of(context).primaryColor),
                      focusedBorder: _getBorderStyle(),
                      enabledBorder: _getBorderStyle(),
                      errorBorder: _getBorderStyle()
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                SizedBox(
                  width: 78.w,
                  child: TextFormField(
                    controller: emailController,
                    validator: (email) {
                      if (!Validation.isEmail(email!)) {
                        return 'Invalid email format';
                      } else if(FireAuth.usedEmail.isNotEmpty){
                        return FireAuth.usedEmail;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 2.h),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter email',
                      hintStyle: TextStyle(color: Theme.of(context).primaryColor),
                      focusedBorder: _getBorderStyle(),
                      enabledBorder: _getBorderStyle(),
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                SizedBox(
                  width: 78.w,
                  child: TextFormField(
                    controller: passwordController,
                    validator: (password) {
                      if (!Validation.isPassword(password!)) {
                        return 'at least 6 characters, symbols, capital letters,\nand numbers';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 2.h),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter Password',
                      hintStyle: TextStyle(color: Theme.of(context).primaryColor),
                      focusedBorder: _getBorderStyle(),
                      enabledBorder: _getBorderStyle(),
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                SizedBox(
                  width: 78.w,
                  child: TextFormField(
                    controller: confirmController,
                    validator: (password){
                      if(password != passwordController.text){
                        return 'passwords do not match';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 2.h),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(color: Theme.of(context).primaryColor),
                      focusedBorder: _getBorderStyle(),
                      enabledBorder: _getBorderStyle(),
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                SizedBox(
                    width: 78.w,
                    height: 5.5.h,
                    child: ElevatedButton(
                      onPressed: () {
                        if(fKey.currentState!.validate()){
                          fire.registerUser(context, email: emailController.text, password: passwordController.text);
                          FocusManager.instance.primaryFocus!.unfocus();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.w))),
                      child: Text(
                        'Register',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    )),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('already have an account?',
                      style: TextStyle(fontSize: 12.sp, color: Colors.white)),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => LogIn()));
                      },
                      child: const Text(
                        'Log in',
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

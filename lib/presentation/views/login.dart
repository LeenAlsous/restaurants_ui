import 'package:flutter/material.dart';
import 'package:oop/helper/validation_functions.dart';
import 'package:oop/presentation/views/bottom_nav_bar.dart';
import 'package:oop/presentation/views/registration.dart';
import 'package:oop/presentation/widgets/background.dart';
import 'package:sizer/sizer.dart';

class LogIn extends StatelessWidget {
  LogIn({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

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
                    validator: (email) {
                      if (!Validation.isEmail(email!)) {
                        return 'Invalid email format';
                      }
                      return null;
                    },
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
                        if (formKey.currentState!.validate()) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BottomNavBar()));
                        }
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
                              builder: (context) => Registration()));
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
                                builder: (context) => Registration()));
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

import 'package:flutter/material.dart';
import 'package:oop/presentation/views/login.dart';
import 'package:oop/presentation/widgets/background.dart';
import 'package:sizer/sizer.dart';

class Registration extends StatelessWidget {
  const Registration({Key? key}) : super(key: key);

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
                  SizedBox(height: 5.h),
                  SizedBox(
                    width: 78.w,
                    child: TextFormField(
                      // color FDF9E2
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 2.h),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter full name',
                        hintStyle:
                            TextStyle(color: Theme.of(context).primaryColor),
                        focusedBorder: _getBorderStyle(),
                        enabledBorder: _getBorderStyle(),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  SizedBox(
                    width: 78.w,
                    child: TextFormField(
                      // color FDF9E2
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 2.h),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter username',
                        hintStyle:
                            TextStyle(color: Theme.of(context).primaryColor),
                        focusedBorder: _getBorderStyle(),
                        enabledBorder: _getBorderStyle(),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  SizedBox(
                    width: 78.w,
                    child: TextFormField(
                      // color FDF9E2
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
                  SizedBox(height: 5.h),
                  SizedBox(
                    width: 78.w,
                    child: TextFormField(
                      // color FDF9E2
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
                  SizedBox(height: 5.h),
                  SizedBox(
                    width: 78.w,
                    child: TextFormField(
                      // color FDF9E2
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 2.h),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Confirm Password',
                        hintStyle:
                            TextStyle(color: Theme.of(context).primaryColor),
                        focusedBorder: _getBorderStyle(),
                        enabledBorder: _getBorderStyle(),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  SizedBox(
                      width: 78.w,
                      height: 5.5.h,
                      child: ElevatedButton(
                        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const LogIn()));},
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
                        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const LogIn()));},
                        child: const Text(
                          'Log in',
                          style: TextStyle(color: Color(0xFF73211D)),
                        )),
                  ]),
                ],
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

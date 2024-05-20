import 'package:flutter/material.dart';
import 'package:oop/presentation/views/home.dart';
import 'package:oop/presentation/views/registration.dart';
import 'package:oop/presentation/widgets/background.dart';
import 'package:sizer/sizer.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){FocusManager.instance.primaryFocus!.unfocus();},
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BackgroundImage(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
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
              SizedBox(height: 5.h,),
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
                    hintStyle: TextStyle(color: Theme.of(context).primaryColor),
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
                  // color FDF9E2
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
              SizedBox(
                height: 8.h,
              ),
              SizedBox(
                  width: 78.w,
                  height: 5.5.h,
                  child: ElevatedButton(
                    onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));},
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
                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Registration()));},
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(color: Color(0xFF73211D)),
                  )),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('Don\'t have an account?',
                    style: TextStyle(fontSize: 12.sp, color: Colors.white)),
                TextButton(
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Registration()));},
                    child: const Text(
                      'Register',
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

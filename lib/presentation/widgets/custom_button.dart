import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  const CustomButton({Key? key, this.onPressed, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 78.w,
        height: 5.5.h,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.w))),
          child: Text(
            label,
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ));
  }
}

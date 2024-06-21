import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oop/business_logic/models/menu_item.dart';
import 'package:oop/presentation/widgets/custom_button.dart';
import 'package:sizer/sizer.dart';

class ModalBottomSheet {
  static void show(BuildContext context, MenuItem item) {
    int quantity = 0;
    showModalBottomSheet(

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      context: context,
      builder: (context) {
        return Column(
          children: [
            SizedBox(
                height: 40.h,
                width: 100.w,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.network(
                      item.image,
                      fit: BoxFit.cover,
                    ))),
            Padding(
              padding: EdgeInsets.all(3.w),
              child: Column(
                children: [
                  Text(item.item),
                  Text(item.price.toString()),
                  SizedBox(
                    width: 100.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 6.w,
                            height: 5.5.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Theme.of(context).primaryColor),
                            child: Center(
                                child: Icon(CupertinoIcons.minus,
                                    size: 12.sp,
                                    color: const Color(0xFFcaa49f))),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
                            child: Text(quantity.toString())),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 6.w,
                            height: 5.5.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: const Color(0xFFcaa49f)),
                            child: Center(
                              child: Icon(CupertinoIcons.plus,
                                  color: Theme.of(context).primaryColor,
                                  size: 12.sp),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  CustomButton(
                    label: 'Add to cart',
                    onPressed: () {},
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}

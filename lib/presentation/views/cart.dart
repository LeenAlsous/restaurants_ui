import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oop/dummy_data/restaurants_dummy_info.dart';
import 'package:oop/helper/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late Future<int> quantity;
  SharedPrefs pref = SharedPrefs();

  @override
  void initState() {
    super.initState();
    quantity = pref.getQuantity(restaurants[0].items[2].id);
  }

  void increment() async {
    int current = await pref.getQuantity(restaurants[0].items[2].id);
    setState(() {
      pref.setQuantity(restaurants[0].items[2].id, current + 1);
      quantity = Future.value(current + 1);
    });
  }

  void decrement() async {
    int current = await pref.getQuantity(restaurants[0].items[2].id);
    if (current > 1) {
      setState(() {
        pref.setQuantity(restaurants[0].items[2].id, current - 1);
        quantity = Future.value(current - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Cart',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 3.h,
            ),
            Card(
              color: Colors.white,
              child: ListTile(
                title: Text(restaurants[0].items[2].item),
                subtitle: Text(restaurants[0].items[2].price),
                leading: ClipRRect(
                    borderRadius: BorderRadius.circular(4.w),
                    child: Image.asset(restaurants[0].items[2].image)),
                trailing: SizedBox(
                  width: 23.w,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          decrement();
                        },
                        child: Container(
                          width: 6.w,
                          height: 5.5.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Theme.of(context).primaryColor),
                          child: Center(
                              child: Icon(CupertinoIcons.minus,
                                  size: 12.sp, color: const Color(0xFFcaa49f))),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: FutureBuilder<int>(
                          future: quantity,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Container(
                                width: 3.w,
                              );
                            } else {
                              if (snapshot.hasData) {
                                return Text(snapshot.data.toString(),
                                    style: TextStyle(fontSize: 16.sp));
                              } else {
                                return Text('1',
                                    style: TextStyle(fontSize: 16.sp));
                              }
                            }
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          increment();
                        },
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
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 7.h),
              child: Container(
                height: 25.h,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(3.w)),
                child: Padding(
                  padding: EdgeInsets.all(3.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 12.h,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sub total',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  'Delivery',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  'Discount',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  'Total',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('\$25',
                                    style: TextStyle(color: Colors.white)),
                                Text('\$10',
                                    style: TextStyle(color: Colors.white)),
                                Text('\$5',
                                    style: TextStyle(color: Colors.white)),
                                Text('\$29',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                          width: 80.w,
                          height: 7.h,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.w))),
                            child: Text(
                              'Place my order',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/*Text(
                          quantity.toString(),
                          style: TextStyle(fontSize: 16.sp),
                        ),*/

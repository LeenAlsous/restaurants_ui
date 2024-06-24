import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oop/business_logic/firebase/firebase_db.dart';
import 'package:oop/business_logic/models/cart_item.dart';
import 'package:oop/helper/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  SharedPrefs pref = SharedPrefs();

  @override
  void initState() {
    super.initState();
    //quantity = pref.getQuantity(restaurants[0].items[2].id);
  }

  /* void increment() async {
    int current = await pref.getQuantity(restaurants[0].items[2].id);
    setState(() {
      pref.setQuantity(restaurants[0].items[2].id, current + 1);
      quantity = Future.value(current + 1);
    });
  }*/

  /*void decrement() async {
    int current = await pref.getQuantity(restaurants[0].items[2].id);
    if (current > 1) {
      setState(() {
        pref.setQuantity(restaurants[0].items[2].id, current - 1);
        quantity = Future.value(current - 1);
      });
    }
  }*/

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
            StreamBuilder(
              stream: FireStoreDb().getCart(),
              builder: (context, snapshot) {
                List cart = snapshot.data?.docs ?? [];
                if (snapshot.data == null || cart.isEmpty) {
                  return const Center(
                    child: Text('No items added'),
                  );
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot doc = cart[index];
                      CartItem cartItem = doc.data() as CartItem;
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 0.5.h),
                        child: Card(
                          color: Colors.white,
                          child: ListTile(
                            title: Text(cartItem.itemName),
                            subtitle: Text(cartItem.price.toString()),
                            leading: ClipRRect(
                                borderRadius: BorderRadius.circular(4.w),
                                child: Image.network(cartItem.itemImage)),
                            trailing: SizedBox(
                              width: 23.w,
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      cartItem.quantity--;
                                    },
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
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 2.w),
                                      child: Text(cartItem.quantity.toString())),
                                  GestureDetector(
                                    onTap: () {
                                      cartItem.quantity++;
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
                      );
                    },
                  ),
                );
              },
            ),
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

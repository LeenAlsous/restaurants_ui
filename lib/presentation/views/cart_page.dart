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
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text('No items added'),
                  );
                }
                List<CartItem> cart = snapshot.data!;
                FireStoreDb().calculateTotals(cart);
                return Column(
                  children: [
                    SizedBox(
                      height: 52.5.h,
                      child: ListView.builder(
                        itemCount: cart.length,
                        itemBuilder: (context, index) {
                          CartItem cartItem = cart[index];
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 0.5.h),
                            child: Card(
                              color: Colors.white,
                              child: ListTile(
                                title: Text(cartItem.itemName),
                                subtitle: Text(cartItem.price.toString()),
                                leading: SizedBox(
                                  width: 18.w,
                                  height: 15.h,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4.w),
                                      child: Image.network(cartItem.itemImage, fit: BoxFit.fill,)),
                                ),
                                trailing: SizedBox(
                                  width: 23.w,
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          FireStoreDb().updateQuantity(cartItem.quantity, cartItem.id, '-');
                                        },
                                        child: Container(
                                          width: 6.w,
                                          height: 5.5.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              color:
                                                  Theme.of(context).primaryColor),
                                          child: Center(
                                              child: Icon(CupertinoIcons.minus,
                                                  size: 12.sp,
                                                  color: const Color(0xFFcaa49f))),
                                        ),
                                      ),
                                      Padding(
                                          padding:
                                              EdgeInsets.symmetric(horizontal: 2.w),
                                          child:
                                              Text(cartItem.quantity.toString(), style: TextStyle(fontSize: 16.sp),)),
                                      GestureDetector(
                                        onTap: () {
                                          FireStoreDb().updateQuantity(cartItem.quantity, cartItem.id, '+');
                                        },
                                        child: Container(
                                          width: 6.w,
                                          height: 5.5.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              color: const Color(0xFFcaa49f)),
                                          child: Center(
                                            child: Icon(CupertinoIcons.plus,
                                                color:
                                                    Theme.of(context).primaryColor,
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
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Column(
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
                                        Text('\$${FireStoreDb().calculateTotals(cart).toStringAsFixed(2)}',
                                            style: const TextStyle(color: Colors.white)),
                                        const Text('\$10',
                                            style: TextStyle(color: Colors.white)),
                                        const Text('\$5',
                                            style: TextStyle(color: Colors.white)),
                                        Text('\$${(FireStoreDb().calculateTotals(cart) + 10 - 5).toStringAsFixed(2)}',
                                            style: const TextStyle(color: Colors.white)),
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
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

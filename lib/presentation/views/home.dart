import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oop/business_logic/firebase/firebase_db.dart';
import 'package:oop/business_logic/models/restaurants_info.dart';
import 'package:oop/dummy_data/dummy_popular_menu.dart';
import 'package:oop/presentation/views/restaurant.dart';
import 'package:oop/presentation/widgets/carousel.dart';
import 'package:oop/presentation/widgets/custom_container.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Find your\nfavorite food', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),),
                    Icon(
                      Icons.notifications_none,
                      color: Colors.greenAccent,
                      size: 4.h,
                    )
                  ],
                ),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 78.w,
                      child: TextFormField(
                        // color FDF9E2
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 0, horizontal: 2.h),
                          filled: true,
                          fillColor: const Color(0xFFFDF9E2),
                          prefixIcon: const Icon(
                            CupertinoIcons.search,
                            color: Color(0xFFF3B149),
                          ),
                          hintText: 'What do you want to order?',
                          hintStyle: const TextStyle(color: Color(0xFFF3B149)),
                          focusedBorder: _getBorderStyle(),
                          enabledBorder: _getBorderStyle(),
                        ),
                      ),
                    ),
                    Container(
                      width: 12.w,
                      height: 12.w,
                      decoration: BoxDecoration(
                          color: const Color(0xFFFDF9E2),
                          borderRadius: BorderRadius.circular(3.w)),
                      child: Padding(
                        padding: EdgeInsets.all(2.w),
                        child: Image.asset('assets/filter.png'),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 2.h),
                const Carousel(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Nearest restaurants'),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'View more',
                          style: TextStyle(color: Color(0xFFF3B149)),
                        ))
                  ],
                ),
                StreamBuilder(
                  stream: FireStoreDb().getAllRestaurants(),
                  builder: (context, snapshot) {
                    List restaurants = snapshot.data?.docs ?? [];
                    if (restaurants.isEmpty) {
                      return const Center(
                        child: Text('No restaurants available'),
                      );
                    }
                    return SizedBox(
                        height: 27.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => RestaurantPage(restaurant: restaurants[index]),));
                          itemBuilder: (context, index) {
                            QueryDocumentSnapshot doc = restaurants[index];
                            RestaurantInfo restaurant = doc.data() as RestaurantInfo;
                            String documentId = doc.id;
                            return GestureDetector(
                                onTap: () {
                                  pushWithoutNavBar(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RestaurantPage(
                                            restaurant: restaurant, id: documentId),
                                      ));
                                },
                                child: CustomContainer(detail: restaurant,)
                            );
                          },
                          itemCount: restaurants.length,
                        ));
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Popular menu'),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'View more',
                          style: TextStyle(color: Color(0xFFF3B149)),
                        ))
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 7.h),
                  child: SizedBox(
                      height: 25.5.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            CustomContainer(detail: popularMenu[index]),
                        itemCount: popularMenu.length,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _getBorderStyle() {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(3.w));
  }
}

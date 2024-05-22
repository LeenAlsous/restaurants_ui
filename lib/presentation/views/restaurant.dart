import 'package:flutter/material.dart';
import 'package:oop/business_logic/models/restaurants_info.dart';
import 'package:oop/dummy_data/users_dummy_data.dart';
import 'package:oop/presentation/widgets/custom_container.dart';
import 'package:sizer/sizer.dart';

class RestaurantPage extends StatefulWidget {
  final RestaurantInfo restaurant;

  const RestaurantPage({Key? key, required this.restaurant}) : super(key: key);

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
            SliverAppBar(
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: BackButton(
                    color: const Color(0xFFF3B149),
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                        backgroundColor: const MaterialStatePropertyAll(
                          Color(0xFFFDF9E2),
                        ))),
              ),
              forceElevated: innerBoxIsScrolled,
              floating: true,
              expandedHeight: 25.h,
            flexibleSpace: FlexibleSpaceBar(
            background: Image.asset('assets/restaurant.jpeg', fit: BoxFit.
              fill,),)
            ,
            )
            ];
          },
          body: Container(
              decoration: const BoxDecoration(
                  borderRadius:
                  BorderRadius.vertical(top: Radius.circular(25)),
                  color: Colors.white),
              child: Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 4.w, vertical: 5.h),
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 5.h,
                            width: 20.w,
                            decoration: BoxDecoration(
                                color: const Color(0xFFcaa49f),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                                child: Text(
                                  widget.restaurant.tag,
                                  style: TextStyle(
                                      color: Theme
                                          .of(context)
                                          .primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp),
                                )),
                          ),
                          const Spacer(),
                          IconButton(
                            style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Color(0xFFcaa49f)),
                                shape:
                                MaterialStatePropertyAll(CircleBorder())),
                            onPressed: () {},
                            icon: Icon(Icons.location_on,
                                color: Theme
                                    .of(context)
                                    .primaryColor,
                                size: 25.sp),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          IconButton(
                            style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Color(0xFFcaa49f)),
                                shape:
                                MaterialStatePropertyAll(CircleBorder())),
                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Theme
                                  .of(context)
                                  .primaryColor,
                              size: 25.sp,
                            ),
                            onPressed: () {
                              setState(() {
                                isFavorite = !isFavorite;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(widget.restaurant.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                  color: Colors.black87))),
                      SizedBox(height: 1.h),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined,
                              color: Colors.greenAccent, size: 25.sp),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
                            child: Text(
                              widget.restaurant.distance,
                              style: const TextStyle(color: Colors.black54),
                            ),
                          ),
                          Icon(Icons.star,
                              color: Colors.greenAccent, size: 25.sp),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
                            child: Text(widget.restaurant.rating,
                                style:
                                const TextStyle(color: Colors.black54)),
                          )
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.restaurant.description,
                            maxLines: 3,
                          )),
                      SizedBox(height: 1.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Menu',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                'View all',
                                style: TextStyle(color: Color(0xFFF3B149)),
                              )),
                        ],
                      ),
                      SizedBox(
                          height: 25.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                CustomContainer(
                                  detail: widget.restaurant.items[index],
                                ),
                            itemCount: widget.restaurant.items.length,
                          )),
                      SizedBox(height: 2.h),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Testimonials',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          )),
                      SizedBox(
                        height: 10.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              Row(
                                children: [
                                  Image.asset(
                                    users[index].profileImage,
                                    height: 10.h,
                                    width: 10.h,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(users[index].name),
                                      Text(users[index].testimonial),
                                    ],
                                  )
                                ],
                              ),
                          itemCount: users.length,
                        ),
                      )
                    ],
                  ),
                ),
              )),
        ));
  }
}

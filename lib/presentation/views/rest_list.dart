import 'package:flutter/material.dart';
import 'package:oop/business_logic/firebase/firebase_db.dart';
import 'package:oop/business_logic/models/restaurants_info.dart';

class RestList extends StatefulWidget {
  const RestList({Key? key}) : super(key: key);

  @override
  State<RestList> createState() => _RestListState();
}

class _RestListState extends State<RestList> {
  List<RestaurantInfo> rest = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    FireStoreDb().getRestaurantsList().then((data){
      rest = data;
      isLoading = false;
      if(mounted){
        setState(() {});
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ListView.builder(
        itemCount: rest.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            title: Text(rest[index].name),
          ),
        ),
      ),
    );
  }
}

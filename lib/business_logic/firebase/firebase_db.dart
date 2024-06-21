import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:oop/business_logic/models/menu_item.dart';
import 'package:oop/business_logic/models/restaurants_info.dart';

class FireStoreDb{

  FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getAllRestaurants(){
    final restaurantsRef = db.collection('restaurants').withConverter(fromFirestore: RestaurantInfo.fromMap, toFirestore: (RestaurantInfo info, _) => info.toMap());
    return restaurantsRef.snapshots();
  }

  Stream<QuerySnapshot> getMenu(String id){
    final menuRef = db.collection('restaurants').doc(id).collection('menu').withConverter(fromFirestore: MenuItem.fromMap, toFirestore: (MenuItem item, _) => item.toMap());
    return menuRef.snapshots();
  }

}
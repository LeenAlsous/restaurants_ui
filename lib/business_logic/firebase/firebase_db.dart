import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:oop/business_logic/models/app_user.dart';
import 'package:oop/business_logic/models/cart_item.dart';
import 'package:oop/business_logic/models/menu_item.dart';
import 'package:oop/business_logic/models/restaurants_info.dart';

class FireStoreDb {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final user = FirebaseAuth
      .instance.currentUser; // keep it here? or pass it as an argument?

  Stream<QuerySnapshot> getAllRestaurants() {
    final restaurantsRef = _db.collection('restaurants').withConverter(
        fromFirestore: RestaurantInfo.fromMap,
        toFirestore: (RestaurantInfo info, _) => info.toMap());
    return restaurantsRef.snapshots();
  }

  Stream<QuerySnapshot> getMenu(String id) {
    final menuRef = _db
        .collection('restaurants')
        .doc(id)
        .collection('menu')
        .withConverter(
            fromFirestore: MenuItem.fromMap,
            toFirestore: (MenuItem item, _) => item.toMap());
    return menuRef.snapshots();
  }

  void createUser(AppUser appUser, String id) async {
    final userRef = _db
        .collection('users')
        .withConverter(
            fromFirestore: AppUser.fromMap,
            toFirestore: (AppUser user, _) => user.toMap())
        .doc(id);
    await userRef.set(appUser);
  }

  void addToCart(CartItem cart) async {
    if (user != null) {
      final cartRef = _db
          .collection('users')
          .doc(user?.uid)
          .collection('cart')
          .withConverter(
              fromFirestore: CartItem.fromMap,
              toFirestore: (CartItem toCart, _) => toCart.toMap());
      await cartRef.add(cart);
    }
  }

  Stream<QuerySnapshot>? getCart() {
    if (user != null) {
      final cartRef = _db
          .collection('users')
          .doc(user?.uid)
          .collection('cart')
          .withConverter(
              fromFirestore: CartItem.fromMap,
              toFirestore: (CartItem toCart, _) => toCart.toMap());
      return cartRef.snapshots();
    }
    return null;
  }

  void updateQuantity(int quantity, String docId, String operation) {
    if (user != null) {
      final cartRef =
          _db.collection('users').doc(user?.uid).collection('cart').doc(docId);
      if(operation == '+'){
        cartRef.update({'quantity': FieldValue.increment(1)});
      } else{
        if(quantity > 1){
          cartRef.update({'quantity': FieldValue.increment(-1)});
        }
      }
    }
  }

  void calculateTotals(){

  }
}

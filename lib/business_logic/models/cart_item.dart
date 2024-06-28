import 'package:cloud_firestore/cloud_firestore.dart';

class CartItem {
  final String itemName;
  final String restaurantName;
  final String itemImage;
  late final int quantity;
  final double price;
  final String id;

  CartItem(
      {required this.itemName,
      required this.restaurantName,
      required this.itemImage,
      required this.quantity,
      required this.price,
      required this.id});

  factory CartItem.fromMap(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return CartItem(
        itemName: data?['itemName'],
        restaurantName: data?['restaurantName'],
        itemImage: data?['itemImage'],
        quantity: data?['quantity'],
        price: data?['price'],
      id: snapshot.id
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'itemName': itemName,
      'restaurantName': restaurantName,
      'itemImage': itemImage,
      'quantity': quantity,
      'price': price,
      'id': id
    };
  }
}

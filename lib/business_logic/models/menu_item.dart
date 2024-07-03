import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:oop/business_logic/models/details.dart';

class MenuItem implements Details {
  final String id;
  final String item;
  final double price;
  final String image;
  final List<dynamic> ingredients;

  const MenuItem(this.id, this.item, this.price, this.image, this.ingredients);

  factory MenuItem.fromMap(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return MenuItem(
        data?['id'] ?? snapshot.id, data?['item']?? 'dish', data?['price'], data?['image'], data?['ingredients']??[]);
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'item': item, 'price': price, 'image': image, 'ingredients': ingredients};
  }

  @override
  String get photo => image;

  @override
  String get title => item;

  @override
  String get subTitle => price.toString();
}

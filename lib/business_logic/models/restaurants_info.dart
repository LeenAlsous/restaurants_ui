import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:oop/business_logic/models/details.dart';

import 'menu_item.dart';

class RestaurantInfo implements Details {
  final String id;
  final String name;
  final String logo;
  final String distance;
  final String description;
  final String rating;
  final String tag;
  final List<MenuItem> items;

  const RestaurantInfo(
      {required this.name,
      required this.logo,
      required this.distance,
      required this.description,
      required this.rating,
      required this.tag,
      required this.id,
      required this.items});

  factory RestaurantInfo.fromMap(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return RestaurantInfo(
        name: data?['name'],
        logo: data?['logo'],
        distance: data?['distance'],
        description: data?['description'],
        rating: data?['rating'],
        tag: data?['tag'],
        id: data?['id']??'',
        items: data?['menu']??[]);
  }

  factory RestaurantInfo.fromFireStore(
      Map<String, dynamic> data,
      SnapshotOptions? options) {
    return RestaurantInfo(
        name: data['name'],
        logo: data['logo'],
        distance: data['distance'],
        description: data['description'],
        rating: data['rating'],
        tag: data['tag'],
        id: data['id']??'',
        items: data['menu']??[]);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'logo': logo,
      'distance': distance,
      'description': description,
      'rating': rating,
      'tag': tag,
      'menu': items
    };
  }

  @override
  String get photo => logo;

  @override
  String get title => name;

  @override
  String get subTitle => distance;
}

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

  @override
  String get photo => logo;

  @override
  String get title => name;

  @override
  String get subTitle => distance;
}

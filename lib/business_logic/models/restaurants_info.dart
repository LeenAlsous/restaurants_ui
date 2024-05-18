import 'menu_item.dart';

class RestaurantsInfoModel {
  final String id;
  final String name;
  final String logo;
  final String distance;
  final String description;
  final String rating;
  final String tag;
  final List<MenuItem> items;

  const RestaurantsInfoModel(
      {required this.name,
      required this.logo,
      required this.distance,
      required this.description,
      required this.rating,
      required this.tag,
      required this.id,
      required this.items});
}

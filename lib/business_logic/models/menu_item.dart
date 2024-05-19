import 'package:oop/business_logic/models/details.dart';

class MenuItem implements Details {
  final int id;
  final String item;
  final String price;
  final String image;

  const MenuItem(this.id, this.item, this.price, this.image);

  @override
  String get photo => image;

  @override
  String get title => item;

  @override
  String get subTitle => price;
}

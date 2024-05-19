import 'package:oop/business_logic/models/menu_item.dart';
import 'package:oop/business_logic/models/restaurants_info.dart';

const restaurants = [
  RestaurantInfo(
      id: '1',
      name: 'The Gourmet Spot',
      logo: 'assets/farm.png',
      distance: '1.2 miles',
      description: 'A cozy spot offering a fusion of modern and traditional cuisines.',
      rating: '4.8',
      tag: 'Fine Dining',
      items: [
        MenuItem(1, 'Truffle Risotto', '25.99', 'assets/pasta.jpeg'),
        MenuItem(2, 'Filet Mignon', '39.99', 'assets/pasta.jpeg'),
        MenuItem(3, 'Lobster Bisque', '19.99', 'assets/pasta.jpeg'),
        MenuItem(4, 'Duck Confit', '28.99', 'assets/pasta.jpeg'),
        MenuItem(5, 'Chocolate Soufflé', '12.99', 'assets/pasta.jpeg'),
        MenuItem(6, 'Wine Pairing', '15.99', 'assets/pasta.jpeg'),
      ]
  ),
  RestaurantInfo(
      id: '2',
      name: 'Pizza Paradise',
      logo: 'assets/pizza_logo.png',
      distance: '0.5 miles',
      description: 'A family-friendly pizzeria with a wide variety of toppings and styles.',
      rating: '4.5',
      tag: 'Fast Food',
      items: [
        MenuItem(1, 'Margherita Pizza', '14.99', 'assets/pasta.jpeg'),
        MenuItem(2, 'Pepperoni Pizza', '16.99', 'assets/pasta.jpeg'),
        MenuItem(3, 'BBQ Chicken Pizza', '18.99', 'assets/pasta.jpeg'),
        MenuItem(4, 'Veggie Supreme Pizza', '15.99', 'assets/pasta.jpeg'),
        MenuItem(5, 'Hawaiian Pizza', '17.99', 'assets/pasta.jpeg'),
        MenuItem(6, 'Cheese Breadsticks', '8.99', 'assets/pasta.jpeg'),
      ]
  ),
  RestaurantInfo(
      id: '3',
      name: 'Sushi Haven',
      logo: 'assets/Japanese_food.png',
      distance: '2.3 miles',
      description: 'A sushi lover\'s dream with fresh fish and creative rolls.',
      rating: '4.7',
      tag: 'Japanese',
      items: [
        MenuItem(1, 'California Roll', '12.99', 'assets/pasta.jpeg'),
        MenuItem(2, 'Spicy Tuna Roll', '14.99', 'assets/pasta.jpeg'),
        MenuItem(3, 'Dragon Roll', '16.99', 'assets/pasta.jpeg'),
        MenuItem(4, 'Salmon Sashimi', '19.99', 'assets/pasta.jpeg'),
        MenuItem(5, 'Miso Soup', '5.99', 'assets/pasta.jpeg'),
        MenuItem(6, 'Green Tea Ice Cream', '6.99', 'assets/pasta.jpeg'),
      ]
  ),
  RestaurantInfo(
      id: '4',
      name: 'Veggie Delight',
      logo: 'assets/vegan.png',
      distance: '1.1 miles',
      description: 'A vegetarian and vegan restaurant with a variety of healthy options.',
      rating: '4.4',
      tag: 'Vegetarian',
      items: [
        MenuItem(1, 'Grilled Vegetable Platter', '13.99', 'assets/pasta.jpeg'),
        MenuItem(2, 'Vegan Burger', '11.99', 'assets/pasta.jpeg'),
        MenuItem(3, 'Quinoa Salad', '10.99', 'assets/pasta.jpeg'),
        MenuItem(4, 'Stuffed Peppers', '12.99', 'assets/pasta.jpeg'),
        MenuItem(5, 'Vegan Chocolate Cake', '7.99', 'assets/pasta.jpeg'),
        MenuItem(6, 'Fresh Juice', '5.99', 'assets/pasta.jpeg'),
      ]
  ),
  RestaurantInfo(
      id: '5',
      name: 'Taco Town',
      logo: 'assets/taco.png',
      distance: '0.8 miles',
      description: 'A casual spot serving up authentic Mexican tacos and more.',
      rating: '4.3',
      tag: 'Mexican',
      items: [
        MenuItem(1, 'Chicken Taco', '3.99', 'assets/pasta.jpeg'),
        MenuItem(2, 'Beef Taco', '4.49', 'assets/pasta.jpeg'),
        MenuItem(3, 'Fish Taco', '4.99', 'assets/pasta.jpeg'),
        MenuItem(4, 'Vegetarian Taco', '3.99', 'assets/pasta.jpeg'),
        MenuItem(5, 'Churros', '5.49', 'assets/pasta.jpeg'),
        MenuItem(6, 'Margarita', '7.99', 'assets/pasta.jpeg'),
      ]
  ),
  RestaurantInfo(
      id: '6',
      name: 'Pasta Palace',
      logo: 'assets/fast_food.png',
      distance: '1.5 miles',
      description: 'An Italian restaurant with a range of classic and contemporary pasta dishes.',
      rating: '4.7',
      tag: 'Italian',
      items: [
        MenuItem(1, 'Spaghetti Carbonara', '14.99', 'assets/pasta.jpeg'),
        MenuItem(2, 'Fettuccine Alfredo', '13.99', 'assets/pasta.jpeg'),
        MenuItem(3, 'Lasagna', '16.99', 'assets/pasta.jpeg'),
        MenuItem(4, 'Pesto Penne', '13.99', 'assets/pasta.jpeg'),
        MenuItem(5, 'Garlic Bread', '6.99', 'assets/pasta.jpeg'),
        MenuItem(6, 'Tiramisu', '8.99', 'assets/pasta.jpeg'),
      ]
  ),
  RestaurantInfo(
      id: '7',
      name: 'Bakery Bliss',
      logo: 'assets/pink_cake.png',
      distance: '0.4 miles',
      description: 'A delightful bakery offering a wide range of freshly baked goods.',
      rating: '4.9',
      tag: 'Bakery',
      items: [
        MenuItem(1, 'Croissant', '2.99', 'assets/pasta.jpeg'),
        MenuItem(2, 'Chocolate Chip Cookie', '1.49', 'assets/pasta.jpeg'),
        MenuItem(3, 'Blueberry Muffin', '2.49', 'assets/pasta.jpeg'),
        MenuItem(4, 'Cinnamon Roll', '3.49', 'assets/pasta.jpeg'),
        MenuItem(5, 'Red Velvet Cupcake', '2.99', 'assets/pasta.jpeg'),
        MenuItem(6, 'Cheesecake Slice', '4.99', 'assets/pasta.jpeg'),
      ]
  ),
];

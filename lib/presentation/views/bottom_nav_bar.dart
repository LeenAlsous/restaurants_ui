import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oop/presentation/views/cart_page.dart';
import 'package:oop/presentation/views/home_page.dart';
import 'package:oop/presentation/views/profile_page.dart';
import 'package:oop/presentation/widgets/custom_nav_bar_style.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<PersistentTabConfig> tabs = [
      PersistentTabConfig(screen: const HomePage(), item: ItemConfig(icon: const Icon(Icons.home_filled), title: 'Home')),
      PersistentTabConfig(screen: const Placeholder(), item: ItemConfig(icon: const Icon(CupertinoIcons.chat_bubble_text), title: 'Chat')),
      PersistentTabConfig(screen: const CartPage(), item: ItemConfig(icon: const Icon(Icons.shopping_cart_rounded), title: 'Cart')),
      PersistentTabConfig(screen: const ProfilePage(), item: ItemConfig(icon: const Icon(Icons.person), title: 'Profile'))
    ];
    return PersistentTabView(
        tabs: tabs,
        navBarBuilder: (navBarConfig) =>
            StyleBottomNavBar(navBarConfig: navBarConfig));
  }
}

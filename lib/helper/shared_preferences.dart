import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs{
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  //final String favoriteKey = 'favorite';

  void setFavorite(String restaurantID) async{
    SharedPreferences prefs = await _prefs;
    prefs.setBool(restaurantID, true);
  }

  Future<bool> getFavorite(String restaurantID) async{
    SharedPreferences prefs = await _prefs;
    bool? isFav = prefs.getBool(restaurantID) ?? false;
    return isFav;
  }

  void removeFavorite(String restaurantID) async{
    SharedPreferences prefs = await _prefs;
    prefs.remove(restaurantID);
  }

  void setQuantity(String itemID, int quantity) async{
    SharedPreferences pref = await _prefs;
    pref.setInt(itemID, quantity);
  }

  Future<int> getQuantity(String itemID) async{
    SharedPreferences pref = await _prefs;
    return pref.getInt(itemID) ?? 1;
  }
}
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefService {
  static SharedPreferences? _preferences;
  static PrefService? _instance;

  static Future<PrefService> getInstance() async {
    _instance = PrefService();
    _preferences = await SharedPreferences.getInstance();
    return _instance!;
  }

  void setUserData({
    @required Map<String, dynamic>? data,
  }) {
    _preferences?.setString('userData', json.encode(data));
  }

  void setCartData({
    @required Map<String, dynamic>? data,
  }) {
    _preferences?.setString('Cart', json.encode(data));
  }

  Map? getCartData() {
    var dataStr = _preferences?.getString('Cart');
    if (dataStr == null) return null;
    return json.decode(dataStr);
  }

  Map? getUserData() {
    var dataStr = _preferences?.getString('userData');
    if (dataStr == null) return null;
    return json.decode(dataStr);
  }

  Future<Future<bool>?> clearCartData() async =>
      _preferences?.setString('Cart', "null");
  Future<Future<bool>?> clearUserData() async => _preferences?.clear();

  ///intro
  bool get isShowIntro => _preferences?.getBool('isShowIntro') ?? true;
  set isShowIntro(bool value) => _preferences?.setBool('isShowIntro', value);

  ///

  bool get isLogin => _preferences?.getBool('isLogin') ?? false;
  set isLogin(bool value) => _preferences?.setBool('isLogin', value);





  String get userLocal => _preferences?.getString('userLocal') ?? 'ar';
  set userLocal(String value) => _preferences?.setString('userLocal', value);

  String get firebaseToken => _preferences?.getString('firebaseToken') ?? '123';
  set firebaseToken(String value) =>
      _preferences?.setString('firebaseToken', value);

  String get userToken => _preferences?.getString('userToken') ?? '';
  void setuserToken(String value) =>
      _preferences?.setString('userToken', value);
  /////
  void setUserProducts({
    required Map<String, dynamic>? data,
  }) {
    _preferences?.setString('allproducts', json.encode(data));
  }

  Map? getUserProducts() {
    var dataStr = _preferences?.getString('allproducts');
    if (dataStr == null) return null;
    return json.decode(dataStr);
  }

  bool get isOnline => _preferences?.getBool('isOnline') ?? true;
  set isOnline(bool value) => _preferences?.setBool('isOnline', value);

  bool get liveApp => _preferences?.getBool('liveonApp') ?? true;
  set liveApp(bool value) => _preferences?.setBool('liveonApp', value);

  void setStoreData({
    @required Map<String, dynamic>? data,
  }) {
    _preferences?.setString('storeinfo', json.encode(data));
  }

  Map? getStoreData() {
    var dataStr = _preferences?.getString('storeinfo');
    if (dataStr == null) return null;
    return json.decode(dataStr);
  }
}

import 'package:shared_preferences/shared_preferences.dart';

abstract interface class ITokenAuthCache {
  Future saveToken(String token);
  Future deleteToken();
  Future<String?> getToken();
  Future<bool> hasToken();
}

class TokenAuthCache implements ITokenAuthCache {
  late SharedPreferences _prefs;

  TokenAuthCache._privateConstructor();
  static final TokenAuthCache _instance = TokenAuthCache._privateConstructor();
  static TokenAuthCache get instance => _instance;

  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Future saveToken(String token) async {
    await _initSharedPreferences();
    if (await hasToken() == false) {
      await _prefs.setString('auth_token', token);
    }
  }

  @override
  Future deleteToken() async {
    await _initSharedPreferences();
    print(await hasToken());
    if (await hasToken() == true) {
      await _prefs.remove('auth_token');
    }
  }

  @override
  Future<String?> getToken() async {
    await _initSharedPreferences();
    return _prefs.getString('auth_token');
  }

  @override
  Future<bool> hasToken() async {
    await _initSharedPreferences();
    return _prefs.containsKey('auth_token') &&
        _prefs.getString('auth_token')!.isNotEmpty;
  }
}

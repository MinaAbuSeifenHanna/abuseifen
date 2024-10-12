import '../../../Core/Enums/storage_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Handles the session token to the user
class AuthService {
  /// Used to save user token while app is killed
  final Future<SharedPreferences> _prefs;

  /// Holds the value of the user token
  String _userToken = '';

  AuthService(this._prefs);

  /// A getter that returns the value of [_userToken] which holds the value of the user token
  String get userToken => _userToken;

  /// Sets the user token after login
  setUserToken(String tkn) {
    _prefs.then(
        (value) => value.setString(StorageEnum.userToken.toString(), tkn));
    _userToken = tkn;
  }

  /// Clear token and credential
  clearAuth() {
    _userToken = '';
    _prefs.then((value) {
      value.setString(StorageEnum.userToken.toString(), '');
    });
  }
}

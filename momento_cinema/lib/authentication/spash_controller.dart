import 'package:momento_cinema/shared_preferences_keys.dart';
import 'package:momento_cinema/authentication/splash_states.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController {
  Future<SplashState> isAuthenticated() async {
    final prefs = await SharedPreferences.getInstance();
    final isAuthenticated = prefs.getBool(SharedPreferencesKeys.UserLogged) ??
        false; // os ?? -> se for nulo ja retorna falso

    if (isAuthenticated) {
      return SplashStateAuthenticated();
    } else {
      return SplashStateUnauthenticated();
    }
  }
}

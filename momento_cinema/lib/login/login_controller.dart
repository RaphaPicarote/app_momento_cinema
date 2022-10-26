import 'package:momento_cinema/login/login_states.dart';
import 'package:momento_cinema/shared_preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  Future<LoginState> login(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();

    if (email == 'rapha@teste.com' && password == '123456') {
      prefs.setBool(SharedPreferencesKeys.UserLogged, true);
      return LoginStateSuccess();
    } else {
      return LoginStateError('Senha invalida');
    }
  }
}

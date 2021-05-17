import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {

  @observable
  String email = "";

  @action
  void setEmail(value) => email = value;

  @observable
  String password = "";

  @action
  void setPassword(value) => password = value;

  @observable
  bool passwordVisible = false;

  @observable
  bool loading = false;

  @observable
  bool loggedIn = false;

  @action
  void trogglePasswordVisible() => passwordVisible = !passwordVisible;

  @computed
  bool get isEmailValid => email.length >= 6;

  @computed
  bool get isPasswordValid => password.length >= 6;

  @computed
  Function get loginPressed =>
    (isEmailValid && isPasswordValid && !loading) ? login : null;

  Future<void> login() async {
    loading = true;

    await Future.delayed(Duration(seconds: 2));

    loading = false;
    loggedIn = true;

    email = "";
    password = "";
  }

  @action
  void logout(){
    loggedIn = false;
  }

}
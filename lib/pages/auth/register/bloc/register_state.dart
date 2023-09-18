class RegisterState {
  final String username, email, password, rePassword;

  RegisterState(
      {this.username = "",
      this.email = "",
      this.password = "",
      this.rePassword = ""});

  RegisterState copyWith(
      {String? username, String? email, String? password, String? rePassword}) {
    return RegisterState(
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
        rePassword: rePassword ?? this.rePassword);
  }
}

//class which has final objects and const constructor is called immutable
//immutable class is thread safe

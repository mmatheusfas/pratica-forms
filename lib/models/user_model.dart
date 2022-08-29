import 'package:flutter/cupertino.dart';

@immutable
class User {
  
  final String name;
  final String email;
  final String password;
  
  User({ 
     this.name = '',
     this.email = '',
     this.password = ''
  });

  User copyWith({
    String? name,
    String? email,
    String? password,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    ); 
  }
}

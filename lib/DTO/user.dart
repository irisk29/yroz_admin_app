import 'package:flutter/foundation.dart';

class User {
  final String name;
  final String email;
  final double cashback;
  final String imgUrl;
  final String id;

  User(this.id, this.name, this.email, this.cashback, this.imgUrl);
}
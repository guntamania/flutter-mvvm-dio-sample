import 'package:dio_sample/network/response/address.dart';

class User {
  User({
    required this.id,
    required this.username,
    required this.email,
    required this.address
  });

  int id;
  String username;
  String email;
  Address address;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    username: json['username'],
    email: json['email'],
    address: Address.fromJson(json['address']),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "address": address.toJson(),
  };
}



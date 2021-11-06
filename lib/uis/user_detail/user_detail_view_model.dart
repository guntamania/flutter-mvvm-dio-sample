import 'package:dio_sample/network/dio_client.dart';
import 'package:dio_sample/network/response/user.dart';
import 'package:flutter/widgets.dart';

class UserDetailViewModel extends ChangeNotifier {
  User? user;
  String? addressString;

  void fetch(int id) {
    DioClient()
        .getUser(id)
        .then((value)=> user = value)
        .whenComplete(() => notifyListeners());
  }
}
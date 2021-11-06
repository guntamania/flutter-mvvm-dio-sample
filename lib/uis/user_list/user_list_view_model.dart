import 'package:dio_sample/network/dio_client.dart';
import 'package:dio_sample/network/response/user.dart';
import 'package:flutter/widgets.dart';

class UserListViewModel extends ChangeNotifier {

  List<User?> users = List.empty();
  User? targetUser;

  void fetch() {
    DioClient().getUsers()
        .then((value) => users = value)
        .whenComplete(() => notifyListeners());
  }

  void gotoDetail(User? user) {
    targetUser = user;
    notifyListeners();
  }
}
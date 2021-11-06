import 'package:dio/dio.dart';
import 'response/user.dart';

class DioClient{
  final Dio _dio = Dio();

  final _baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<User?>> getUsers() async {
    List<User?> users = List.empty();
    try {
      Response response = await _dio.get(_baseUrl + '/users');
      print('User Info: ${response.data}');
      final decodedJson = response.data as List<dynamic>;
      users = decodedJson.map((e) => User.fromJson(e)).toList();
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return users;
  }

  Future<User?> getUser(int id) async {
    User? user;
    try {
      Response response = await _dio.get(_baseUrl + '/users/$id');
      print('User Info: ${response.data}');
      user = User.fromJson(response.data);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return user;
  }
}
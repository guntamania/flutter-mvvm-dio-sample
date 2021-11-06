import 'package:dio_sample/uis/user_detail/user_detail_widget.dart';
import 'package:dio_sample/uis/user_list/user_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: HomeWidget(),
      initialRoute: "/",
      routes: <String, WidgetBuilder>{
        "/": (BuildContext context) => UserListWidget(),
        "/detail": (BuildContext context) => UserDetailWidget(),
      },
    );
  }
}

import 'dart:developer';

import 'package:dio_sample/core/stateful_wrapper.dart';
import 'package:dio_sample/network/response/address.dart';
import 'package:dio_sample/uis/user_detail/user_detail_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDetailWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            UserDetailViewModel vm = UserDetailViewModel();
            return vm;
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('title'),
        ),
        body: _UserDetailPage(),
      ),
    );
  }
}

class _UserDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<UserDetailViewModel>(context);
    final int? id = ModalRoute.of(context)!.settings.arguments as int?;
    return StatefulWrapper(
      onInit: () {
        log("gonna fetch: " + id!.toString());
        vm.fetch(id);
      },
      child: _body(vm),
    );
  }

  Widget _body(UserDetailViewModel vm) {
    return (vm.user == null)
        ? _emptyView()
        : Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _nameArea(vm.user!.username),
                _emailArea(vm.user!.email),
                _addressArea(vm.user!.address),
              ],
            ),
            padding: EdgeInsets.all(20),
          );
  }

  Widget _nameArea(String username) => Container(
          child: Row(
        children: [
          _title("Name"),
          Text(
            "$username",
            style: TextStyle(fontSize: 26.0),
          ),
        ],
      ));

  Widget _emailArea(String email) => Container(
        child: Row(children: [_title("Email"), Text(email)]),
      );

  Widget _addressArea(Address address) => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [_title("Zipcode"), Text("${address.zipcode}")],
            ),
            Row(
              children: [
                _title("Address"),
                Wrap(
                  direction: Axis.horizontal,
                  children: [
                    Container(
                        child: Text(
                          "${address.suite}",
                        ),
                        padding: EdgeInsets.only(right: 34)),
                    Container(
                        child: Text(
                          "${address.street}",
                        ),
                        padding: EdgeInsets.only(right: 3)),
                    Container(
                        child: Text(
                          "${address.city}",
                        ),
                        padding: EdgeInsets.only(right: 3)),
                  ],
                ),
              ],
            ),
          ],
        ),
      );

  Widget _title(String title) => Container(
        child: Text(title),
        width: 80,
        padding: EdgeInsets.only(top: 10.0),
      );

  Widget _emptyView() => Container(
        child: CircularProgressIndicator(),
        alignment: Alignment.center,
      );
}

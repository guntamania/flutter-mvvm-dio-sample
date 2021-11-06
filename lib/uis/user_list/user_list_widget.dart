import 'package:dio_sample/network/response/user.dart';
import 'package:dio_sample/uis/user_list/user_list_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          UserListViewModel vm = UserListViewModel();
          vm.fetch();
          return vm;
        },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('title'),
        ),
        body: _UserListPage(),
      ),
    );
  }
}

class _UserListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<UserListViewModel>(context);
    if (vm.targetUser != null) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        Navigator.of(context).pushNamed("/detail", arguments: vm.targetUser!.id);
      });
    }

    return ListView.builder(
      itemBuilder: (context, index) {
        if (vm.users.isEmpty) {
          return Container(child: ListTile(title: Text("Empty")));
        } else {
          return _UserListItem(
              vm.users[index],
                  (user) => {vm.gotoDetail(user)}
          );
        }
      },
      itemCount: vm.users.length,
    );
  }

  Widget _UserListItem(User? user, void Function(User) onTap) {
    return Container(
      decoration: new BoxDecoration(
          border:
          new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
      child: ListTile(
        title: Text(user!.username),
        subtitle: Text(user.email),
        onTap: () => { onTap(user) },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/users_view_model.dart';
import 'package:mvvm_architecture_demo/data/response/status.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UsersViewModel(),
      child: Consumer<UsersViewModel>(
        builder: (_, homeProvider, __) => Scaffold(
          appBar: AppBar(
            title: const Text("Users Screen"),
          ),
          body: Column(
            children: <Widget>[
              TextButton(
                onPressed: () {
                  homeProvider.fetchUsersListApi();
                },
                child: const Text("Fetch Users List"),
              ),
              if (homeProvider.usersList.status != null &&
                  homeProvider.usersList.status == Status.LOADING)
                const Center(child: CircularProgressIndicator())
              else if (homeProvider.usersList.status != null &&
                  homeProvider.usersList.status == Status.ERROR)
                Center(child: Text(homeProvider.usersList.message.toString()))
              else
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: homeProvider.usersList.data!.users!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Text(homeProvider
                          .usersList.data!.users![index].firstName
                          .toString()),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mvvm_architecture_demo/model/user_model.dart';

import '../data/response/api_response.dart';
import '../respository/users_repository.dart';

class UsersViewModel with ChangeNotifier {
  final _myRepo = UsersRepository();

  ApiResponse<UserListModel> usersList =
      ApiResponse.error("Press Fetch UserList Button to get the users");

  setUsersList(ApiResponse<UserListModel> response) {
    usersList = response;
    notifyListeners();
  }

  Future<void> fetchUsersListApi() async {
    setUsersList(ApiResponse.loading());

    _myRepo.fetchUsersList().then((value) {
      setUsersList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setUsersList(ApiResponse.error(error.toString()));
    });
  }
}

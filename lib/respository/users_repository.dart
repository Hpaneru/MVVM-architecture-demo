import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mvvm_architecture_demo/data/network/network_api_service.dart';

import '../data/network/base_api_service.dart';
import '../model/user_model.dart';
import '../res/urls.dart';

class UsersRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<UserListModel> fetchUsersList() async {
    final HttpLink httpLink = HttpLink(AppURL.getAllUsersURL);
    String data = """
{
users(first: 5) {
id
userId
firstName
backgroundColor
blockNumber
instagram
tags
followedUsersCount
followingUsersCount
followedUsers
followers
}
}
""";

    try {
      dynamic response = await _apiServices.getPostApiResponse(httpLink, data);
      return response = UserListModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}

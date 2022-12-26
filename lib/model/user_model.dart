class UserListModel {
  List<Users>? users;

  UserListModel({this.users});

  UserListModel.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(Users.fromJson(v));
      });
    }
  }
}

class Users {
  Users({
    required this.id,
    required this.userId,
    required this.firstName,
    required this.backgroundColor,
    required this.blockNumber,
    required this.instagram,
    required this.tags,
    required this.followedUsersCount,
    required this.followingUsersCount,
    required this.followedUsers,
    required this.followers,
  });

  String id;
  String userId;
  String firstName;
  String backgroundColor;
  String blockNumber;
  String instagram;
  List<String> tags;
  int followedUsersCount;
  int followingUsersCount;
  List<String> followedUsers;
  List<String> followers;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        userId: json["userId"],
        firstName: json["firstName"],
        backgroundColor: json["backgroundColor"],
        blockNumber: json["blockNumber"],
        instagram: json["instagram"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        followedUsersCount: json["followedUsersCount"],
        followingUsersCount: json["followingUsersCount"],
        followedUsers: List<String>.from(json["followedUsers"].map((x) => x)),
        followers: List<String>.from(json["followers"].map((x) => x)),
      );
}
